import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/timetable/timetable_model.dart';
import '../../models/user/user_model.dart';
import '../../providers/current_timetable.dart';
import '../../providers/providers.dart';
import '../../repositories/global_repository.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';
import '../../support/date_time_converter.dart';
import '../../support/fast_swipe_physics.dart';
import '../lesson_card/card_styles/lesson_card.dart';
import '../search_page/search_page.dart';
import '../timetable_list_pages/timetable_list_page.dart';
import '../timetable_list_pages/widgets/searched_table_card.dart';
import '../timetable_settings_page/widgets/labeled_text.dart';
import '../widgets/week_timeline.dart';

import '../../styles/build_context_extension.dart';
import 'widgets/lesson_placeholder.dart';

class TimetablePage extends ConsumerStatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimetablePageState();
}

class _TimetablePageState extends ConsumerState<TimetablePage> {
  static const initialPage = 366;
  final dayPageController = PageController(initialPage: initialPage);
  Timer? timer;
  Timetable? timeTable;
  late final TimetableGlobalSavesRepository globalStore;

  Future<Timetable?> loadTimeTable() async {
    await Future.delayed(const Duration(seconds: 1));

    if (timeTable != null) {
      final list = await globalStore.getTimetablesOnId([timeTable!.id]);
      if (list?.isNotEmpty == true) {
        return list!.first;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    globalStore = ref.read(globalRepositoryStore);

    timeTable = ref.read(localStorage).currentTimetable;

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        ref.read(currentDate.notifier).state = DateTime.now();
      }
    });

    loadTimeTable().then((value) {
      ref.read(localStorage.notifier).save(value ?? Timetable.empty(AppUser.empty()));
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  int getNextLessonIndex() {
    final today = Duration(
      milliseconds: DateTime.now().startOfDay().millisecondsSinceEpoch,
    ).inDays;

    var creationDay = 0;

    if (timeTable != null) {
      creationDay = Duration(
            milliseconds: timeTable!.creationDate.startOfDay().millisecondsSinceEpoch,
          ).inDays -
          timeTable!.creationDate.weekday +
          1;
    }

    final date = ref.read(currentDate);
    final todayIndex = (today - creationDay) % 14;

    if (timeTable != null) {
      if (timeTable!.config.timeIntervals[0].from > date.timeOfDay() &&
          !timeTable!.days[todayIndex].lessons[0].isEmpty) {
        return 0;
      }

      for (int i = 0; i < timeTable!.config.timeIntervals.length - 1; i++) {
        if (!timeTable!.days[todayIndex].lessons[i + 1].isEmpty) {
          if ((timeTable!.config.timeIntervals[i].to < date.timeOfDay() ||
                  timeTable!.days[todayIndex].lessons[i].isEmpty) &&
              timeTable!.config.timeIntervals[i + 1].from > date.timeOfDay()) {
            return i + 1;
          }
        }
      }
    }

    return -1;
  }

  int getCurrentLessonIndex() {
    final today = Duration(
      milliseconds: DateTime.now().startOfDay().millisecondsSinceEpoch,
    ).inDays;

    var creationDay = 0;

    if (timeTable != null) {
      creationDay = Duration(
            milliseconds: timeTable!.creationDate.startOfDay().millisecondsSinceEpoch,
          ).inDays -
          timeTable!.creationDate.weekday +
          1;
    }

    final date = ref.read(currentDate);
    final todayIndex = (today - creationDay) % 14;

    if (timeTable != null) {
      for (int i = 0; i < timeTable!.config.timeIntervals.length - 1; i++) {
        if (timeTable!.config.timeIntervals[i].constains(date) && !timeTable!.days[todayIndex].lessons[i].isEmpty) {
          return i;
        }
      }
    }

    return -1;
  }

  LessonCardState getStateForIndex(int index, int pageIndex) {
    if (pageIndex == 366) {
      if (getNextLessonIndex() == index && getCurrentLessonIndex() == -1) {
        return LessonCardState.next;
      } else if (getCurrentLessonIndex() == index) {
        return LessonCardState.current;
      }
    }
    return LessonCardState.normal;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    ref.listen<bool>(
      needSwipeDays,
      (previous, next) {
        final selectedDay = ref.read(selectedDuration);
        if (next) {
          ref.read(daysSwiping.notifier).state = true;

          ref.read(needSwipeDays.notifier).state = false;
          dayPageController
              .animateToPage(
                366 + selectedDay.inDays,
                duration: const Duration(milliseconds: 330),
                curve: Curves.easeInOut,
              )
              .then((value) => ref.read(daysSwiping.notifier).state = false);
        }
      },
    );

    timeTable = ref.watch(localStorage.select((value) => value.currentTimetable));
    final time = ref.watch(currentDate);

    int creationDay = 0;
    if (timeTable != null) {
      creationDay = Duration(
            milliseconds: timeTable!.creationDate.startOfDay().millisecondsSinceEpoch,
          ).inDays -
          timeTable!.creationDate.weekday +
          1;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        leading: IconButton(
          icon: const Icon(Icons.calendar_month_outlined),
          splashRadius: 24,
          onPressed: () {
            final selectedDate = DateTime.fromMillisecondsSinceEpoch(
              ref.read(currentDate).millisecondsSinceEpoch + ref.read(selectedDuration).inMilliseconds,
            );
            showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: selectedDate.subtract(const Duration(days: 365)),
              lastDate: selectedDate.add(const Duration(days: 365)),
            ).then((date) {
              if (date != null) {
                var now = Duration(
                  milliseconds: ref.read(currentDate).startOfDay().millisecondsSinceEpoch,
                ).inDays;

                final selected = Duration(milliseconds: date.millisecondsSinceEpoch).inDays;
                ref.read(selectedDuration.notifier).state = Duration(days: selected - now);
                ref.read(needSwipeDays.notifier).state = true;
              }
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            splashRadius: 24,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const TimetableListPage();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            splashRadius: 24,
            onPressed: () {
              openSearchPage(colors);
            },
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      backgroundColor: colors.backgroundPrimary!,
      body: timeTable != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    timeTable!.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.largeTitle,
                    textAlign: TextAlign.start,
                  ),
                ),
                const WeekTimeline(),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.separator,
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const CustomPageViewScrollPhysics(),
                    padEnds: true,
                    allowImplicitScrolling: false,
                    controller: dayPageController,
                    dragStartBehavior: DragStartBehavior.down,
                    onPageChanged: (value) {
                      if (!ref.read(daysSwiping)) {
                        ref.read(selectedDuration.notifier).state = Duration(days: value - 366);
                      }
                    },
                    itemCount: 1000,
                    itemBuilder: (context, pageIndex) {
                      final today = Duration(
                        milliseconds: DateTime.now().startOfDay().millisecondsSinceEpoch,
                      ).inDays;

                      print(today);

                      final dayIndex = (today - creationDay + pageIndex - 366) % 14;
                      return ListView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        children: [
                          LabeledText(
                            label: "Неделя",
                            text: timeTable!.config.weekTypes[dayIndex ~/ 7],
                          ),
                          if (timeTable!.days[dayIndex].lessons.where((lesson) => !lesson.isEmpty).isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 8,
                              ),
                              child: LessonPlaceholder(
                                offset: pageIndex - initialPage,
                              ),
                            )
                          else
                            for (int index = 0; index < timeTable!.days[dayIndex].lessons.length; index++)
                              if (!timeTable!.days[dayIndex].lessons[index].isEmpty)
                                Padding(
                                  key: ValueKey(index),
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                    left: 16,
                                    right: 16,
                                  ),
                                  child: LessonCard(
                                    index: index + 1,
                                    interval: timeTable!.config.timeIntervals[index],
                                    lesson: timeTable!.days[dayIndex].lessons[index],
                                    state: getStateForIndex(index, pageIndex),
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                )
              ],
            )
          : Center(
              child: Container(
                alignment: Alignment.center,
                height: 256,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundPrimary,
                    border: Border.all(
                      color: colors.separator!,
                      width: 1,
                    ),
                    borderRadius: BorderRadiusStyles.normal,
                  ),
                  child: TextButton(
                    onPressed: () {
                      openSearchPage(colors);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Найти расписание",
                        style: textStyles.label,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void openSearchPage(AppColors colors) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SearchPage<Timetable>(
            filter: (name) {
              return globalStore.getSearchedTimetables(name);
            },
            itemBuilder: (table) {
              return SearchedTableCard(
                timeTable: table,
                onTap: () {
                  ref.read(localStorage.notifier).save(table);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}
