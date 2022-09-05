import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../gen/assets.gen.dart';
import '../../models/day/day_model.dart';
import '../../models/lesson/editable_lesson.dart';
import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/my_timetables.dart';
import '../../providers/providers.dart';
import '../../providers/user_auth.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../../support/fast_swipe_physics.dart';
import '../lesson_card/card_styles/editable_lesson_card.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';
import '../lesson_editor_page/lesson_editor_page.dart';
import '../timetable_settings_page/widgets/labeled_text.dart';
import '../timetable_settings_page/timetable_settings_page.dart';
import '../widgets/popup_menu_action.dart';
import '../widgets/week_timeline.dart';
import 'widgets/paste_bar.dart';

class TimetableEditorPage extends ConsumerWidget {
  const TimetableEditorPage({Key? key, this.timeTable}) : super(key: key);

  final Timetable? timeTable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(currentEditingTimetable.notifier).state =
        timeTable ?? Timetable.empty(ref.read(userAuth));
    return const _TimetableEditor();
  }
}

class _TimetableEditor extends ConsumerStatefulWidget {
  const _TimetableEditor({Key? key}) : super(key: key);

  @override
  ConsumerState<_TimetableEditor> createState() => _TimetableEditorPageState();
}

class _TimetableEditorPageState extends ConsumerState<_TimetableEditor> {
  var dayPageController = PageController(initialPage: 0);

  void deleteLesson(int lessonDay, int lessonNumber) {
    ref.read(currentEditingTimetable.notifier).update(
      (state) {
        List<Day> newDays = List<Day>.from(state.days)
          ..[lessonDay] = Day(
            lessons: List<Lesson>.from(state.days[lessonDay].lessons)
              ..[lessonNumber] =
                  const Lesson(name: '', type: '', teacher: '', audience: ''),
          );
        return state.copyWith(
          days: newDays,
        );
      },
    );
  }

  void copyLesson(Lesson lesson) {
    ref.read(editorCopiedLesson.notifier).update(
          (state) => lesson,
        );
  }

  void insertLesson(Lesson lesson, int day, int index) {
    ref.read(currentEditingTimetable.notifier).update(
      (state) {
        List<Day> newDays = List<Day>.from(state.days)
          ..[day] = Day(
            lessons: List<Lesson>.from(state.days[day].lessons)
              ..[index] = lesson,
          );
        return state.copyWith(
          days: newDays,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    dayPageController =
        PageController(initialPage: ref.read(currentDate).weekday - 1);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    final config =
        ref.watch(currentEditingTimetable.select((value) => value.config));
    final name =
        ref.watch(currentEditingTimetable.select((value) => value.name));
    final days =
        ref.watch(currentEditingTimetable.select((value) => value.days));
    final copiedLesson = ref.watch(editorCopiedLesson);

    ref.listen<bool>(
      needSwipeDays,
      (previous, next) {
        final selectedDay = ref.read(selectedDuration);
        if (next) {
          ref.read(daysSwiping.notifier).state = true;

          ref.read(needSwipeDays.notifier).state = false;
          dayPageController
              .animateToPage(
                dayPageController.initialPage + selectedDay.inDays,
                duration: const Duration(milliseconds: 330),
                curve: Curves.easeInOut,
              )
              .then((value) => ref.read(daysSwiping.notifier).state = false);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: textStyles.title,
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            final Timetable newTimetable = ref.read(currentEditingTimetable);
            if (!newTimetable.isEmpty) {
              ref
                  .read(myTimetables.notifier)
                  .save(ref.read(currentEditingTimetable));
            }
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            Assets.images.circleChevronLeft.path,
            color: colors.accentPrimary,
          ),
          splashRadius: 24,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // временно переход в настройки

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const TimetableSettingsPage();
                  },
                ),
              );
            },
            icon: SvgPicture.asset(
              Assets.images.settings.path,
              color: colors.accentPrimary,
            ),
            splashRadius: 24,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const WeekTimeline(
              weekCount: 2,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: colors.separator,
            ),
            Expanded(
              child: PageView.builder(
                controller: dayPageController,
                physics: const CustomPageViewScrollPhysics(),
                itemCount: 14,
                onPageChanged: (value) {
                  if (!ref.read(daysSwiping)) {
                    ref.read(selectedDuration.notifier).state =
                        Duration(days: value - dayPageController.initialPage);
                  }
                },
                itemBuilder: (context, dayIndex) {
                  return ReorderableListView(
                    scrollController: ScrollController(),
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    onReorderStart: (index) {
                      HapticFeedback.heavyImpact();
                    },
                    onReorderEnd: (index) {
                      HapticFeedback.heavyImpact();
                    },
                    proxyDecorator: (child, index, animation) {
                      return Material(
                        type: MaterialType.transparency,
                        child: AnimatedBuilder(
                          animation: animation,
                          builder: (context, _) {
                            return Transform.scale(
                              scale: Tween<double>(begin: 1, end: 1.05)
                                  .animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOutBack,
                                    ),
                                  )
                                  .value,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    header: Column(
                      children: [
                        LabeledText(
                          label: 'Неделя',
                          text: config.weekTypes[dayIndex ~/ 7],
                          padding: 0,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    onReorder: (oldIndex, newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      log('onReorder');

                      final lessons = List<Lesson>.from(
                        ref
                            .watch(currentEditingTimetable.notifier)
                            .state
                            .days[dayIndex]
                            .lessons,
                      );

                      final Lesson item = lessons.removeAt(oldIndex);

                      lessons.insert(newIndex, item);

                      ref.read(currentEditingTimetable.notifier).update(
                        (state) {
                          List<Day> newDays = List<Day>.from(state.days)
                            ..[dayIndex] = Day(
                              lessons: lessons,
                            );
                          return state.copyWith(
                            days: newDays,
                          );
                        },
                      );
                    },
                    children: [
                      for (int index = 0;
                          index < days[dayIndex].lessons.length;
                          index++)
                        if (days[dayIndex].lessons[index].isEmpty)
                          Padding(
                            key: ValueKey(index),
                            padding: const EdgeInsets.only(bottom: 12),
                            child: EmptyLessonCard(
                              index: index + 1,
                              // взять из заданного времени
                              interval: TimeInterval(
                                from: config.timeIntervals[index].from,
                                to: config.timeIntervals[index].to,
                              ),
                              onTap: () {
                                if (copiedLesson == null) {
                                  ref
                                      .read(
                                        currentEditingLesson.notifier,
                                      )
                                      .state = EditableLesson(
                                    day: dayIndex,
                                    number: index,
                                    lesson: days[dayIndex].lessons[index],
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LessonEditorPage(),
                                    ),
                                  );
                                } else {
                                  insertLesson(copiedLesson, dayIndex, index);
                                }
                              },
                              text:
                                  copiedLesson == null ? null : "Вставить пару",
                            ),
                          )
                        else
                          Padding(
                            key: ValueKey(index),
                            padding: const EdgeInsets.only(bottom: 12),
                            child: EditableLessonCard(
                              index: index + 1,
                              // взять из заданного времени
                              interval: TimeInterval(
                                from: config.timeIntervals[index].from,
                                to: config.timeIntervals[index].to,
                              ),
                              lesson: days[dayIndex].lessons[index],
                              actions: [
                                // реализовать действия
                                PopupMenuAction(
                                  text: "Изменить",
                                  icon: Assets.images.iconEditOutline
                                      .svg(color: colors.accentPrimary),
                                  action: () {
                                    ref
                                        .read(
                                          currentEditingLesson.notifier,
                                        )
                                        .state = EditableLesson(
                                      day: dayIndex,
                                      number: index,
                                      lesson: days[dayIndex].lessons[index],
                                    );

                                    context.go(context.namedLocation('lesson'));
                                  },
                                ),
                                PopupMenuAction(
                                  text: "Копировать пару",
                                  icon: Assets.images.command
                                      .svg(color: colors.accentPrimary),
                                  action: () {
                                    copyLesson(days[dayIndex].lessons[index]);
                                  },
                                ),
                                PopupMenuAction(
                                  text: "Удалить",
                                  icon: Assets.images.trashFull
                                      .svg(color: colors.accentPrimary),
                                  action: () {
                                    deleteLesson(dayIndex, index);
                                  },
                                  style: PopupMenuActionStyle.destructive,
                                ),
                              ],
                            ),
                          )
                    ],
                  );
                },
              ),
            ),
            if (copiedLesson != null) const PasteBar(),
          ],
        ),
      ),
    );
  }
}
