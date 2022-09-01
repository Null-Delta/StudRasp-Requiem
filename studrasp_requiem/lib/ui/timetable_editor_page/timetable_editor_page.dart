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
import '../../support/firebase.dart';
import '../lesson_card/card_styles/editable_lesson_card.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';
import '../lesson_editor_page/lesson_editor_page.dart';
import '../timetable_settings_page/labeled_text.dart';
import '../timetable_settings_page/timetable_settings_page.dart';
import '../widgets/popup_menu_action.dart';
import '../widgets/week_timeline.dart';

final currentEditingTimetable = StateProvider<Timetable>((ref) {
  return Timetable.empty();
});

final selectedDay = Provider<int>((ref) {
  final currentDay = ref.watch(currentDate);
  int weekValue = ref.watch(selectedDuration).inDays + currentDay.weekday - 1;
  if (weekValue >= 14) {
    weekValue = currentDay.weekday - 1;
  }
  return weekValue;
});

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

    final editingDay = ref.watch(selectedDay);

    return ProviderScope(
      overrides: [
        currentEditingTimetable.overrideWithValue(
          StateController(widget.timeTable ?? Timetable.empty()),
        ),
      ],
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colors.backgroundPrimary,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.only(left: 16),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // переход назад временно
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    Assets.images.circleChevronLeft.path,
                    color: colors.accentPrimary,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: textStyles.title,
              ),
              Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // временно переход в настройки
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const TimeTableSettingsPage();
                        },
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    Assets.images.settings.path,
                    color: colors.accentPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const WeekTimeline(
              weekCount: 2,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: colors.separator,
            ),
            LabeledText(
              label: 'Неделя',
              text: config.weekTypes[editingDay ~/ 7],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: days[editingDay].lessons.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (context, index) {
                    if (days[editingDay].lessons[index].isEmpty) {
                      return EmptyLessonCard(
                        index: index + 1,
                        // взять из заданного времени
                        interval: TimeInterval(
                          from: config.timeIntervals[index].from,
                          to: config.timeIntervals[index].to,
                        ),
                        onTap: () {
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
                        },
                      );
                    } else {
                      return EditableLessonCard(
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
                              emailRegister('', 'girya', '');
                            },
                          ),
                          PopupMenuAction(
                            text: "Удалить",
                            icon: Assets.images.trashFull
                                .svg(color: colors.accentPrimary),
                            action: () {
                              singIn('', '');
                              // deleteLesson(editingDay, index);
                            },
                            style: PopupMenuActionStyle.destructive,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
