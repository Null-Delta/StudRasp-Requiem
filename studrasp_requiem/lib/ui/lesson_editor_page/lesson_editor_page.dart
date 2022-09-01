import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../models/day/day_model.dart';
import '../../models/lesson/lesson_model.dart';
import '../../providers/providers.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../widgets/app_text_field.dart';

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
  late Lesson lesson = ref
      .read(currentEditingTimetable)
      .days[widget.lessonDay]
      .lessons[widget.lessonNumber];

  late TextEditingController name = TextEditingController(text: lesson.name);

  late TextEditingController audience =
      TextEditingController(text: lesson.audience);

  late TextEditingController teacher =
      TextEditingController(text: lesson.teacher);

  late TextEditingController type = TextEditingController(text: lesson.type);

  void saveChanges() {
    Lesson newLesson = Lesson(
      name: name.text,
      type: type.text,
      teacher: teacher.text,
      audience: audience.text,
    );

    ref.read(currentEditingTimetable.notifier).update(
      (state) {
        List<Day> newDays = List<Day>.from(state.days)
          ..[widget.lessonDay] = Day(
            lessons: List<Lesson>.from(state.days[widget.lessonDay].lessons)
              ..[widget.lessonNumber] = newLesson,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    controller: name,
                    label: 'Название предмета',
                    hint: 'Дискретная математика',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppTextField(
                    controller: audience,
                    label: 'Аудитория',
                    hint: '104',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppTextField(
                    controller: teacher,
                    label: 'Преподаватель',
                    hint: 'Жук А. С.',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppTextField(
                    controller: type,
                    label: 'Тип',
                    hint: 'Практика',
                    onTap: () {},
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
