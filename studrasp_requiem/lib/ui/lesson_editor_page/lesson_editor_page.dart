import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../models/day/day_model.dart';
import '../../models/lesson/lesson_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../timetable_editor_page/timetable_editor_page.dart';
import 'widgets/lesson_part_input.dart';

final currentEditingLesson = StateProvider<Lesson>((ref) {
  return const Lesson(name: '', type: '', teacher: '', audience: '');
});

class LessonEditorPage extends ConsumerStatefulWidget {
  const LessonEditorPage({
    Key? key,
    required this.lessonDay,
    required this.lessonNumber,
  }) : super(key: key);

  final int lessonDay;
  final int lessonNumber;

  @override
  ConsumerState<LessonEditorPage> createState() => _LessonEditorPageState();
}

class _LessonEditorPageState extends ConsumerState<LessonEditorPage> {
  late TextEditingController nameTextEditingController = TextEditingController()
    ..text = ref.read(currentEditingTimetable).days[widget.lessonDay].lessons[widget.lessonNumber].name;
  late TextEditingController audienceTextEditingController = TextEditingController()
    ..text = ref.read(currentEditingTimetable).days[widget.lessonDay].lessons[widget.lessonNumber].audience;
  late TextEditingController teacherTextEditingController = TextEditingController()
    ..text = ref.read(currentEditingTimetable).days[widget.lessonDay].lessons[widget.lessonNumber].teacher;
  late TextEditingController typeTextEditingController = TextEditingController()
    ..text = ref.read(currentEditingTimetable).days[widget.lessonDay].lessons[widget.lessonNumber].type;

  void saveChanges() {
    Lesson newLesson = Lesson(
      name: nameTextEditingController.text,
      type: typeTextEditingController.text,
      teacher: teacherTextEditingController.text,
      audience: audienceTextEditingController.text,
    );

    ref.read(currentEditingTimetable.notifier).update(
      (state) {
        List<Day> newDays = List<Day>.from(state.days)
          ..[widget.lessonDay] = Day(
            lessons: List<Lesson>.from(state.days[widget.lessonDay].lessons)..[widget.lessonNumber] = newLesson,
          );
        return state.copyWith(
          days: newDays,
        );
      },
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    final lesson = ref.watch(
      currentEditingTimetable.select(
        (value) => value.days[widget.lessonDay].lessons[widget.lessonNumber],
      ),
    );

    return ProviderScope(
      overrides: [
        currentEditingLesson.overrideWithValue(StateController(lesson)),
      ],
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colors.backgroundPrimary,
          leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // переход назад и сохранение
              saveChanges();
            },
            icon: SvgPicture.asset(
              Assets.images.circleChevronLeft.path,
              color: colors.accentPrimary,
            ),
            splashRadius: 24,
          ),
          title: Text(
            'Пара',
            style: textStyles.title,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Divider(
              height: 1,
              thickness: 1,
              color: colors.separator,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LessonPartInput(
                    partName: 'Название предмета',
                    controller: nameTextEditingController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  LessonPartInput(
                    partName: 'Аудитория',
                    controller: audienceTextEditingController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  LessonPartInput(
                    partName: 'Преподаватель',
                    controller: teacherTextEditingController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  LessonPartInput(
                    partName: 'Тип',
                    controller: typeTextEditingController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
