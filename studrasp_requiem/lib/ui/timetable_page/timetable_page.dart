import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../models/timetable_config/timetable_config_model.dart';
import '../../models/user/user_model.dart';
import '../../providers/providers.dart';
import '../../providers/user_auth.dart';
import '../../repositories/global_repository.dart';
import '../../styles/colors.dart';
import '../../support/fast_swipe_physics.dart';
import '../lesson_card/card_styles/lesson_card.dart';
import '../search_page/search_page.dart';
import '../timetable_editor_page/timetable_editor_page.dart';
import '../timetable_list_pages/timetable_list_page.dart';
import '../timetable_list_pages/widgets/time_table_card.dart';
import '../widgets/week_timeline.dart';

import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../styles/build_context_extension.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';

class TimetablePage extends ConsumerStatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimetablePageState();
}

class _TimetablePageState extends ConsumerState<TimetablePage> {
  final dayPageController = PageController(initialPage: 366);

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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TimetableGlobalSavesRepositoryImpl()
              .saveTimetable(Timetable.empty(ref.read(userAuth)));
        },
      ),
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        leading: IconButton(
          icon: const Icon(Icons.calendar_month_outlined),
          splashRadius: 24,
          onPressed: () {
            final selectedDate = DateTime.fromMillisecondsSinceEpoch(
              ref.read(currentDate).millisecondsSinceEpoch +
                  ref.read(selectedDuration).inMilliseconds,
            );
            showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: selectedDate.subtract(const Duration(days: 365)),
              lastDate: selectedDate.add(const Duration(days: 365)),
            ).then((date) {
              if (date != null) {
                final now = Duration(
                  milliseconds: ref.read(currentDate).millisecondsSinceEpoch,
                ).inDays;
                final selected =
                    Duration(milliseconds: date.millisecondsSinceEpoch).inDays;
                ref.read(selectedDuration.notifier).state =
                    Duration(days: selected - now + 1);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              ref.read(selectedDuration.notifier).update((state) {
                return const Duration();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TimetableEditorPage(
                      timeTable: ref.watch(currentTimetable),
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                ref.watch(currentTimetable.select((value) => value.name)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles.largeTitle,
                textAlign: TextAlign.start,
              ),
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
                  ref.read(selectedDuration.notifier).state =
                      Duration(days: value - 366);
                }
              },
              itemCount: 1000,
              itemBuilder: (context, index) {
                return ListView.separated(
                  controller: ScrollController(),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: 8,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (context, index) {
                    final type = Random().nextInt(100) % 2;
                    if (type == 0) {
                      return EmptyLessonCard(
                        index: index % 10,
                        interval: TimeInterval(
                          from: Duration(hours: index),
                          to: Duration(hours: index + 1),
                        ),
                      );
                    } else {
                      return LessonCard(
                        index: index % 10,
                        lesson: Lesson.random(),
                        interval: TimeInterval(
                          from: Duration(hours: index),
                          to: Duration(hours: index + 1),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          )
        ],
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
              int count = Random().nextInt(20);
              return List<Timetable>.generate(
                count,
                (index) => Timetable(
                  id: "0",
                  name: "${Random().nextInt(100)}",
                  days: [],
                  owner: const AppUser(
                    id: "0",
                    name: "JakeApps",
                    email: '',
                    photoURL: "",
                    isVerified: false,
                  ),
                  editors: [],
                  lastEditor: const AppUser(
                    id: "0",
                    name: "JakeApps",
                    email: '',
                    photoURL: "",
                    isVerified: false,
                  ),
                  creationDate: DateTime.now(),
                  lastUpdateDate: DateTime.now(),
                  config: TimetableConfig.empty(),
                ),
              );
            },
            itemBuilder: (table) {
              return TimetableCard(
                timeTable: table,
                button: IconButton(
                  onPressed: () {},
                  icon: Assets.images.iconSaveOutline.svg(
                    color: colors.accentPrimary,
                  ),
                  splashRadius: 24,
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
