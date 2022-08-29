import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_model.freezed.dart';

part 'lesson_model.g.dart';

@freezed
class Lesson with _$Lesson {
  const Lesson._();

  const factory Lesson({
    required String name,
    required String type,
    required String teacher,
    required String audience,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, Object?> json) => _$LessonFromJson(json);
}
