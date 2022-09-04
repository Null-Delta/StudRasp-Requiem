import 'package:freezed_annotation/freezed_annotation.dart';

import 'lesson_model.dart';

part 'editable_lesson.freezed.dart';
part 'editable_lesson.g.dart';

@freezed
class EditableLesson with _$EditableLesson {
  factory EditableLesson({
    required int day,
    required int number,
    required Lesson lesson,
  }) = _EditableLesson;

  factory EditableLesson.fromJson(Map<String, dynamic> json) =>
      _$EditableLessonFromJson(json);
}
