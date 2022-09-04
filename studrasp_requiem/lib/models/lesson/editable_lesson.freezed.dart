// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'editable_lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditableLesson _$EditableLessonFromJson(Map<String, dynamic> json) {
  return _EditableLesson.fromJson(json);
}

/// @nodoc
mixin _$EditableLesson {
  int get day => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  Lesson get lesson => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditableLessonCopyWith<EditableLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditableLessonCopyWith<$Res> {
  factory $EditableLessonCopyWith(
          EditableLesson value, $Res Function(EditableLesson) then) =
      _$EditableLessonCopyWithImpl<$Res>;
  $Res call({int day, int number, Lesson lesson});

  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class _$EditableLessonCopyWithImpl<$Res>
    implements $EditableLessonCopyWith<$Res> {
  _$EditableLessonCopyWithImpl(this._value, this._then);

  final EditableLesson _value;
  // ignore: unused_field
  final $Res Function(EditableLesson) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? number = freezed,
    Object? lesson = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: lesson == freezed
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
    ));
  }

  @override
  $LessonCopyWith<$Res> get lesson {
    return $LessonCopyWith<$Res>(_value.lesson, (value) {
      return _then(_value.copyWith(lesson: value));
    });
  }
}

/// @nodoc
abstract class _$$_EditableLessonCopyWith<$Res>
    implements $EditableLessonCopyWith<$Res> {
  factory _$$_EditableLessonCopyWith(
          _$_EditableLesson value, $Res Function(_$_EditableLesson) then) =
      __$$_EditableLessonCopyWithImpl<$Res>;
  @override
  $Res call({int day, int number, Lesson lesson});

  @override
  $LessonCopyWith<$Res> get lesson;
}

/// @nodoc
class __$$_EditableLessonCopyWithImpl<$Res>
    extends _$EditableLessonCopyWithImpl<$Res>
    implements _$$_EditableLessonCopyWith<$Res> {
  __$$_EditableLessonCopyWithImpl(
      _$_EditableLesson _value, $Res Function(_$_EditableLesson) _then)
      : super(_value, (v) => _then(v as _$_EditableLesson));

  @override
  _$_EditableLesson get _value => super._value as _$_EditableLesson;

  @override
  $Res call({
    Object? day = freezed,
    Object? number = freezed,
    Object? lesson = freezed,
  }) {
    return _then(_$_EditableLesson(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: lesson == freezed
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as Lesson,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditableLesson implements _EditableLesson {
  _$_EditableLesson(
      {required this.day, required this.number, required this.lesson});

  factory _$_EditableLesson.fromJson(Map<String, dynamic> json) =>
      _$$_EditableLessonFromJson(json);

  @override
  final int day;
  @override
  final int number;
  @override
  final Lesson lesson;

  @override
  String toString() {
    return 'EditableLesson(day: $day, number: $number, lesson: $lesson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditableLesson &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.lesson, lesson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(lesson));

  @JsonKey(ignore: true)
  @override
  _$$_EditableLessonCopyWith<_$_EditableLesson> get copyWith =>
      __$$_EditableLessonCopyWithImpl<_$_EditableLesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditableLessonToJson(
      this,
    );
  }
}

abstract class _EditableLesson implements EditableLesson {
  factory _EditableLesson(
      {required final int day,
      required final int number,
      required final Lesson lesson}) = _$_EditableLesson;

  factory _EditableLesson.fromJson(Map<String, dynamic> json) =
      _$_EditableLesson.fromJson;

  @override
  int get day;
  @override
  int get number;
  @override
  Lesson get lesson;
  @override
  @JsonKey(ignore: true)
  _$$_EditableLessonCopyWith<_$_EditableLesson> get copyWith =>
      throw _privateConstructorUsedError;
}
