import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/assets.gen.dart';
import '../../models/day/day_model.dart';
import '../../models/lesson/editable_lesson.dart';
import '../../models/lesson/lesson_model.dart';
import '../../providers/providers.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../widgets/search_field.dart';

class LessonEditorPage extends ConsumerStatefulWidget {
  const LessonEditorPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LessonEditorPage> createState() => _LessonEditorPageState();
}

class _LessonEditorPageState extends ConsumerState<LessonEditorPage> {
  late EditableLesson editableLesson = ref.read(currentEditingLesson);
  late Lesson lesson = editableLesson.lesson;

  late TextEditingController name = TextEditingController(text: lesson.name);

  late TextEditingController audience =
      TextEditingController(text: lesson.audience);

  late TextEditingController teacher =
      TextEditingController(text: lesson.teacher);

  late TextEditingController type = TextEditingController(text: lesson.type);

  late List<String> lessonsList;
  late List<String> teachersList;
  late List<String> audiencesList;
  late List<String> lessonTypesList;

  @override
  void initState() {
    super.initState();

    final table = ref.read(currentEditingTimetable);

    lessonsList = table.days
        .map((day) => day.lessons.map((lesson) => lesson.name))
        .fold<List<String>>(
          [],
          (previousValue, element) => [...previousValue, ...element],
        )
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();

    teachersList = table.days
        .map((day) => day.lessons.map((lesson) => lesson.teacher))
        .fold<List<String>>(
          [],
          (previousValue, element) => [...previousValue, ...element],
        )
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();

    audiencesList = table.days
        .map((day) => day.lessons.map((lesson) => lesson.audience))
        .fold<List<String>>(
          [],
          (previousValue, element) => [...previousValue, ...element],
        )
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();

    lessonTypesList = table.days
        .map((day) => day.lessons.map((lesson) => lesson.type))
        .fold<List<String>>(
          [],
          (previousValue, element) => [...previousValue, ...element],
        )
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList();
  }

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
          ..[editableLesson.day] = Day(
            lessons: List<Lesson>.from(state.days[editableLesson.day].lessons)
              ..[editableLesson.number] = newLesson,
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

    final lesson = ref.watch(currentEditingLesson).lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Пара',
          style: textStyles.title,
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            saveChanges();
          },
          icon: SvgPicture.asset(
            Assets.images.circleChevronLeft.path,
            color: colors.accentPrimary,
          ),
          splashRadius: 24,
        ),
      ),
      body: ListView(
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Название предмета",
                    style: textStyles.label,
                  ),
                ),
                SearchTextField(
                  values: lessonsList,
                  controller: name,
                  hint: "Название предмета",
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Аудитория",
                    style: textStyles.label,
                  ),
                ),
                SearchTextField(
                  values: audiencesList,
                  controller: audience,
                  hint: "Аудитория",
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Преподаватель",
                    style: textStyles.label,
                  ),
                ),
                SearchTextField(
                  values: teachersList,
                  controller: teacher,
                  hint: "Преподаватель",
                  isTop: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Тип пары",
                    style: textStyles.label,
                  ),
                ),
                SearchTextField(
                  values: lessonTypesList,
                  controller: type,
                  hint: "Тип пары",
                  isTop: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
