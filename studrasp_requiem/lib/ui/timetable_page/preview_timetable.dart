import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/current_timetable.dart';
import '../../providers/providers.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';
import '../../support/date_time_converter.dart';
import '../../support/fast_swipe_physics.dart';
import '../lesson_card/card_styles/lesson_card.dart';
import '../search_page/search_page.dart';
import '../timetable_list_pages/widgets/searched_table_card.dart';
import '../timetable_settings_page/widgets/labeled_text.dart';
import '../widgets/week_timeline.dart';

import '../../styles/build_context_extension.dart';

class TimetablePreview extends ConsumerStatefulWidget {
  final Timetable? table;

  const TimetablePreview({
    Key? key,
    required this.table,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimetablePreviewState();
}

class _TimetablePreviewState extends ConsumerState<TimetablePreview> {
  final dayPageController = PageController(initialPage: 366);
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        ref.read(currentDate.notifier).state = DateTime.now();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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

    int creationDay = 0;
    if (widget.table != null) {
      creationDay = Duration(
            milliseconds: widget.table!.creationDate.startOfDay().millisecondsSinceEpoch,
          ).inDays -
          widget.table!.creationDate.weekday +
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
                  milliseconds: ref.read(currentDate).millisecondsSinceEpoch,
                ).inMilliseconds;

                now -= ref.read(currentDate).hour * 3600 * 1000;
                now -= ref.read(currentDate).minute * 60 * 1000;
                now -= ref.read(currentDate).second * 1000;
                now -= ref.read(currentDate).millisecond;

                final selected = Duration(milliseconds: date.millisecondsSinceEpoch).inDays;
                ref.read(selectedDuration.notifier).state = Duration(
                  days: selected - Duration(milliseconds: now).inDays,
                );
                ref.read(needSwipeDays.notifier).state = true;
              }
            });
          },
        ),
      ),
      backgroundColor: colors.backgroundPrimary!,
      body: widget.table != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.table!.name,
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
                    itemBuilder: (context, pageImage) {
                      final today = Duration(
                        milliseconds: DateTime.now().millisecondsSinceEpoch,
                      ).inDays;

                      final dayIndex = (today - creationDay + pageImage - 366) % 14;
                      return ListView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        children: [
                          LabeledText(
                            label: "Неделя",
                            text: widget.table!.config.weekTypes[dayIndex ~/ 7],
                          ),
                          if (widget.table!.days[dayIndex].lessons.where((lesson) => !lesson.isEmpty).isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 8,
                              ),
                              child: Container(
                                height: 96,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: colors.backgroundSecondary,
                                  borderRadius: BorderRadiusStyles.large,
                                ),
                                child: Text(
                                  "Сегодня пар нет",
                                  style: textStyles.label!.copyWith(
                                    color: colors.disable,
                                  ),
                                ),
                              ),
                            )
                          else
                            for (int index = 0; index < widget.table!.days[dayIndex].lessons.length; index++)
                              if (!widget.table!.days[dayIndex].lessons[index].isEmpty)
                                Padding(
                                  key: ValueKey(index),
                                  padding: const EdgeInsets.only(
                                    bottom: 12,
                                    left: 16,
                                    right: 16,
                                  ),
                                  child: LessonCard(
                                    index: index + 1,
                                    interval: widget.table!.config.timeIntervals[index],
                                    lesson: widget.table!.days[dayIndex].lessons[index],
                                    isToday: pageImage == 366,
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
              child: Text(
                'Выберите расписание',
                style: textStyles.label!.copyWith(color: colors.disable),
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
              final repository = ref.read(globalRepositoryStore);
              return repository.getSearchedTimetables(name);
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
