// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editable_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditableLesson _$$_EditableLessonFromJson(Map<String, dynamic> json) =>
    _$_EditableLesson(
      day: json['day'] as int,
      number: json['number'] as int,
      lesson: Lesson.fromJson(json['lesson'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EditableLessonToJson(_$_EditableLesson instance) =>
    <String, dynamic>{
      'day': instance.day,
      'number': instance.number,
      'lesson': instance.lesson.toJson(),
    };
