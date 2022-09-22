// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_interval_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) {
  return _TimeInterval.fromJson(json);
}

/// @nodoc
mixin _$TimeInterval {
  Duration get from => throw _privateConstructorUsedError;
  Duration get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeIntervalCopyWith<TimeInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeIntervalCopyWith<$Res> {
  factory $TimeIntervalCopyWith(
          TimeInterval value, $Res Function(TimeInterval) then) =
      _$TimeIntervalCopyWithImpl<$Res>;
  $Res call({Duration from, Duration to});
}

/// @nodoc
class _$TimeIntervalCopyWithImpl<$Res> implements $TimeIntervalCopyWith<$Res> {
  _$TimeIntervalCopyWithImpl(this._value, this._then);

  final TimeInterval _value;
  // ignore: unused_field
  final $Res Function(TimeInterval) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Duration,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeIntervalCopyWith<$Res>
    implements $TimeIntervalCopyWith<$Res> {
  factory _$$_TimeIntervalCopyWith(
          _$_TimeInterval value, $Res Function(_$_TimeInterval) then) =
      __$$_TimeIntervalCopyWithImpl<$Res>;
  @override
  $Res call({Duration from, Duration to});
}

/// @nodoc
class __$$_TimeIntervalCopyWithImpl<$Res>
    extends _$TimeIntervalCopyWithImpl<$Res>
    implements _$$_TimeIntervalCopyWith<$Res> {
  __$$_TimeIntervalCopyWithImpl(
      _$_TimeInterval _value, $Res Function(_$_TimeInterval) _then)
      : super(_value, (v) => _then(v as _$_TimeInterval));

  @override
  _$_TimeInterval get _value => super._value as _$_TimeInterval;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_TimeInterval(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Duration,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeInterval extends _TimeInterval {
  const _$_TimeInterval({required this.from, required this.to}) : super._();

  factory _$_TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$$_TimeIntervalFromJson(json);

  @override
  final Duration from;
  @override
  final Duration to;

  @override
  String toString() {
    return 'TimeInterval(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeInterval &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to));

  @JsonKey(ignore: true)
  @override
  _$$_TimeIntervalCopyWith<_$_TimeInterval> get copyWith =>
      __$$_TimeIntervalCopyWithImpl<_$_TimeInterval>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeIntervalToJson(
      this,
    );
  }
}

abstract class _TimeInterval extends TimeInterval {
  const factory _TimeInterval(
      {required final Duration from,
      required final Duration to}) = _$_TimeInterval;
  const _TimeInterval._() : super._();

  factory _TimeInterval.fromJson(Map<String, dynamic> json) =
      _$_TimeInterval.fromJson;

  @override
  Duration get from;
  @override
  Duration get to;
  @override
  @JsonKey(ignore: true)
  _$$_TimeIntervalCopyWith<_$_TimeInterval> get copyWith =>
      throw _privateConstructorUsedError;
}
