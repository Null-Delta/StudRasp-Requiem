import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'lesson_constants.dart';

part 'lesson_model.freezed.dart';

part 'lesson_model.g.dart';

@freezed
class Lesson with _$Lesson {
  const Lesson._();

  bool get isEmpty =>
      name == '' && type == '' && teacher == '' && audience == '';

  const factory Lesson({
    required String name,
    required String type,
    required String teacher,
    required String audience,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, Object?> json) => _$LessonFromJson(json);

  factory Lesson.empty() => const Lesson(
        name: '',
        type: '',
        teacher: '',
        audience: '',
      );

  factory Lesson.random() {
    final random = Random();

    return Lesson(
      name: LessonConstants.names[random.nextInt(LessonConstants.names.length)],
      type: LessonConstants.types[random.nextInt(LessonConstants.types.length)],
      teacher: LessonConstants
          .teachers[random.nextInt(LessonConstants.teachers.length)],
      audience: random.nextInt(1000).toString(),
    );
  }
}
