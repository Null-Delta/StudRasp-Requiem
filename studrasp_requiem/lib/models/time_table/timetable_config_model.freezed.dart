// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timetable_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeTableConfig _$TimeTableConfigFromJson(Map<String, dynamic> json) {
  return _TimeTableConfig.fromJson(json);
}

/// @nodoc
mixin _$TimeTableConfig {
  List<TimeInterval> get timeIntervals => throw _privateConstructorUsedError;
  List<String> get weekTypes => throw _privateConstructorUsedError;
  List<String> get lessonTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeTableConfigCopyWith<TimeTableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeTableConfigCopyWith<$Res> {
  factory $TimeTableConfigCopyWith(
          TimeTableConfig value, $Res Function(TimeTableConfig) then) =
      _$TimeTableConfigCopyWithImpl<$Res>;
  $Res call(
      {List<TimeInterval> timeIntervals,
      List<String> weekTypes,
      List<String> lessonTypes});
}

/// @nodoc
class _$TimeTableConfigCopyWithImpl<$Res>
    implements $TimeTableConfigCopyWith<$Res> {
  _$TimeTableConfigCopyWithImpl(this._value, this._then);

  final TimeTableConfig _value;
  // ignore: unused_field
  final $Res Function(TimeTableConfig) _then;

  @override
  $Res call({
    Object? timeIntervals = freezed,
    Object? weekTypes = freezed,
    Object? lessonTypes = freezed,
  }) {
    return _then(_value.copyWith(
      timeIntervals: timeIntervals == freezed
          ? _value.timeIntervals
          : timeIntervals // ignore: cast_nullable_to_non_nullable
              as List<TimeInterval>,
      weekTypes: weekTypes == freezed
          ? _value.weekTypes
          : weekTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonTypes: lessonTypes == freezed
          ? _value.lessonTypes
          : lessonTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeTableConfigCopyWith<$Res>
    implements $TimeTableConfigCopyWith<$Res> {
  factory _$$_TimeTableConfigCopyWith(
          _$_TimeTableConfig value, $Res Function(_$_TimeTableConfig) then) =
      __$$_TimeTableConfigCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TimeInterval> timeIntervals,
      List<String> weekTypes,
      List<String> lessonTypes});
}

/// @nodoc
class __$$_TimeTableConfigCopyWithImpl<$Res>
    extends _$TimeTableConfigCopyWithImpl<$Res>
    implements _$$_TimeTableConfigCopyWith<$Res> {
  __$$_TimeTableConfigCopyWithImpl(
      _$_TimeTableConfig _value, $Res Function(_$_TimeTableConfig) _then)
      : super(_value, (v) => _then(v as _$_TimeTableConfig));

  @override
  _$_TimeTableConfig get _value => super._value as _$_TimeTableConfig;

  @override
  $Res call({
    Object? timeIntervals = freezed,
    Object? weekTypes = freezed,
    Object? lessonTypes = freezed,
  }) {
    return _then(_$_TimeTableConfig(
      timeIntervals: timeIntervals == freezed
          ? _value._timeIntervals
          : timeIntervals // ignore: cast_nullable_to_non_nullable
              as List<TimeInterval>,
      weekTypes: weekTypes == freezed
          ? _value._weekTypes
          : weekTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonTypes: lessonTypes == freezed
          ? _value._lessonTypes
          : lessonTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeTableConfig implements _TimeTableConfig {
  const _$_TimeTableConfig(
      {required final List<TimeInterval> timeIntervals,
      required final List<String> weekTypes,
      required final List<String> lessonTypes})
      : _timeIntervals = timeIntervals,
        _weekTypes = weekTypes,
        _lessonTypes = lessonTypes;

  factory _$_TimeTableConfig.fromJson(Map<String, dynamic> json) =>
      _$$_TimeTableConfigFromJson(json);

  final List<TimeInterval> _timeIntervals;
  @override
  List<TimeInterval> get timeIntervals {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeIntervals);
  }

  final List<String> _weekTypes;
  @override
  List<String> get weekTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekTypes);
  }

  final List<String> _lessonTypes;
  @override
  List<String> get lessonTypes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessonTypes);
  }

  @override
  String toString() {
    return 'TimeTableConfig(timeIntervals: $timeIntervals, weekTypes: $weekTypes, lessonTypes: $lessonTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeTableConfig &&
            const DeepCollectionEquality()
                .equals(other._timeIntervals, _timeIntervals) &&
            const DeepCollectionEquality()
                .equals(other._weekTypes, _weekTypes) &&
            const DeepCollectionEquality()
                .equals(other._lessonTypes, _lessonTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_timeIntervals),
      const DeepCollectionEquality().hash(_weekTypes),
      const DeepCollectionEquality().hash(_lessonTypes));

  @JsonKey(ignore: true)
  @override
  _$$_TimeTableConfigCopyWith<_$_TimeTableConfig> get copyWith =>
      __$$_TimeTableConfigCopyWithImpl<_$_TimeTableConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeTableConfigToJson(
      this,
    );
  }
}

abstract class _TimeTableConfig implements TimeTableConfig {
  const factory _TimeTableConfig(
      {required final List<TimeInterval> timeIntervals,
      required final List<String> weekTypes,
      required final List<String> lessonTypes}) = _$_TimeTableConfig;

  factory _TimeTableConfig.fromJson(Map<String, dynamic> json) =
      _$_TimeTableConfig.fromJson;

  @override
  List<TimeInterval> get timeIntervals;
  @override
  List<String> get weekTypes;
  @override
  List<String> get lessonTypes;
  @override
  @JsonKey(ignore: true)
  _$$_TimeTableConfigCopyWith<_$_TimeTableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
