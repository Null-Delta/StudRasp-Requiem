import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../models/day/day_model.dart';
import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/providers.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../lesson_card/card_styles/editable_lesson_card.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';
import '../lesson_editor_page/lesson_editor_page.dart';
import '../timetable_settings_page/labeled_text.dart';
import '../timetable_settings_page/timetable_settings_page.dart';
import '../widgets/popup_menu_action.dart';
import '../widgets/week_timeline.dart';
import 'widgets/paste_bar.dart';

class TimetableEditorPage extends ConsumerStatefulWidget {
  const TimetableEditorPage({Key? key, this.timeTable}) : super(key: key);

  final Timetable? timeTable;

  @override
  ConsumerState<TimetableEditorPage> createState() =>
      _TimetableEditorPageState();
}

class _TimetableEditorPageState extends ConsumerState<TimetableEditorPage> {
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

    final editingDay = ref.watch(selectedDay);

    return ProviderScope(
      overrides: [
        currentEditingTimetable.overrideWithValue(
          StateController(widget.timeTable ?? Timetable.empty()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: textStyles.title,
          ),
          leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // переход назад временно
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
                child: ReorderableListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  proxyDecorator: (child, index, animation) {
                    return Material(
                      type: MaterialType.transparency,
                      child: child,
                    );
                  },
                  header: Column(
                    children: [
                      LabeledText(
                        label: 'Неделя',
                        text: config.weekTypes[editingDay ~/ 7],
                        padding: 0,
                      ),
                      const SizedBox(
                        height: 12,
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
                          .days[editingDay]
                          .lessons,
                    );

                    final Lesson item = lessons.removeAt(oldIndex);

                    lessons.insert(newIndex, item);

                    ref.read(currentEditingTimetable.notifier).update(
                      (state) {
                        List<Day> newDays = List<Day>.from(state.days)
                          ..[editingDay] = Day(
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
                        index < days[editingDay].lessons.length;
                        index++)
                      if (days[editingDay].lessons[index].isEmpty)
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
                                //переход в редактор пары
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LessonEditorPage(
                                        lessonDay: editingDay,
                                        lessonNumber: index,
                                      );
                                    },
                                  ),
                                );
                              } else {
                                insertLesson(copiedLesson, editingDay, index);
                              }
                            },
                            text: copiedLesson == null ? null : "Вставить пару",
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
                            lesson: days[editingDay].lessons[index],
                            actions: [
                              // реализовать действия
                              PopupMenuAction(
                                text: "Изменить",
                                icon: Assets.images.iconEditOutline
                                    .svg(color: colors.accentPrimary),
                                action: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LessonEditorPage(
                                          lessonDay: editingDay,
                                          lessonNumber: index,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              PopupMenuAction(
                                text: "Копировать пару",
                                icon: Assets.images.command
                                    .svg(color: colors.accentPrimary),
                                action: () {
                                  copyLesson(days[editingDay].lessons[index]);
                                },
                              ),
                              PopupMenuAction(
                                text: "Удалить",
                                icon: Assets.images.trashFull
                                    .svg(color: colors.accentPrimary),
                                action: () {
                                  deleteLesson(editingDay, index);
                                },
                                style: PopupMenuActionStyle.destructive,
                              ),
                            ],
                          ),
                        )
                  ],
                ),
              ),
              if (copiedLesson != null) const PasteBar(),
            ],
          ),
        ),
      ),
    );
  }
}
