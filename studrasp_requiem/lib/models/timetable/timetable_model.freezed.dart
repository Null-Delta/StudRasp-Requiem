// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timetable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Day> get days => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  List<User> get editors => throw _privateConstructorUsedError;
  User get lastEditor => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  DateTime get lastUpdateDate => throw _privateConstructorUsedError;
  TimetableConfig get config => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCopyWith<Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCopyWith<$Res> {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) then) =
      _$TimetableCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      List<Day> days,
      User owner,
      List<User> editors,
      User lastEditor,
      DateTime creationDate,
      DateTime lastUpdateDate,
      TimetableConfig config});

  $UserCopyWith<$Res> get owner;
  $UserCopyWith<$Res> get lastEditor;
  $TimetableConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$TimetableCopyWithImpl<$Res> implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._value, this._then);

  final Timetable _value;
  // ignore: unused_field
  final $Res Function(Timetable) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? days = freezed,
    Object? owner = freezed,
    Object? editors = freezed,
    Object? lastEditor = freezed,
    Object? creationDate = freezed,
    Object? lastUpdateDate = freezed,
    Object? config = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      editors: editors == freezed
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      lastEditor: lastEditor == freezed
          ? _value.lastEditor
          : lastEditor // ignore: cast_nullable_to_non_nullable
              as User,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdateDate: lastUpdateDate == freezed
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as TimetableConfig,
    ));
  }

  @override
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }

  @override
  $UserCopyWith<$Res> get lastEditor {
    return $UserCopyWith<$Res>(_value.lastEditor, (value) {
      return _then(_value.copyWith(lastEditor: value));
    });
  }

  @override
  $TimetableConfigCopyWith<$Res> get config {
    return $TimetableConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
abstract class _$$_TimetableCopyWith<$Res> implements $TimetableCopyWith<$Res> {
  factory _$$_TimetableCopyWith(
          _$_Timetable value, $Res Function(_$_Timetable) then) =
      __$$_TimetableCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      List<Day> days,
      User owner,
      List<User> editors,
      User lastEditor,
      DateTime creationDate,
      DateTime lastUpdateDate,
      TimetableConfig config});

  @override
  $UserCopyWith<$Res> get owner;
  @override
  $UserCopyWith<$Res> get lastEditor;
  @override
  $TimetableConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$_TimetableCopyWithImpl<$Res> extends _$TimetableCopyWithImpl<$Res>
    implements _$$_TimetableCopyWith<$Res> {
  __$$_TimetableCopyWithImpl(
      _$_Timetable _value, $Res Function(_$_Timetable) _then)
      : super(_value, (v) => _then(v as _$_Timetable));

  @override
  _$_Timetable get _value => super._value as _$_Timetable;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? days = freezed,
    Object? owner = freezed,
    Object? editors = freezed,
    Object? lastEditor = freezed,
    Object? creationDate = freezed,
    Object? lastUpdateDate = freezed,
    Object? config = freezed,
  }) {
    return _then(_$_Timetable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      days: days == freezed
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      editors: editors == freezed
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<User>,
      lastEditor: lastEditor == freezed
          ? _value.lastEditor
          : lastEditor // ignore: cast_nullable_to_non_nullable
              as User,
      creationDate: creationDate == freezed
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdateDate: lastUpdateDate == freezed
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      config: config == freezed
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as TimetableConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Timetable extends _Timetable {
  const _$_Timetable(
      {required this.id,
      required this.name,
      required final List<Day> days,
      required this.owner,
      required final List<User> editors,
      required this.lastEditor,
      required this.creationDate,
      required this.lastUpdateDate,
      required this.config})
      : _days = days,
        _editors = editors,
        super._();

  factory _$_Timetable.fromJson(Map<String, dynamic> json) =>
      _$$_TimetableFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Day> _days;
  @override
  List<Day> get days {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final User owner;
  final List<User> _editors;
  @override
  List<User> get editors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  final User lastEditor;
  @override
  final DateTime creationDate;
  @override
  final DateTime lastUpdateDate;
  @override
  final TimetableConfig config;

  @override
  String toString() {
    return 'Timetable(id: $id, name: $name, days: $days, owner: $owner, editors: $editors, lastEditor: $lastEditor, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Timetable &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            const DeepCollectionEquality()
                .equals(other.lastEditor, lastEditor) &&
            const DeepCollectionEquality()
                .equals(other.creationDate, creationDate) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdateDate, lastUpdateDate) &&
            const DeepCollectionEquality().equals(other.config, config));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(_editors),
      const DeepCollectionEquality().hash(lastEditor),
      const DeepCollectionEquality().hash(creationDate),
      const DeepCollectionEquality().hash(lastUpdateDate),
      const DeepCollectionEquality().hash(config));

  @JsonKey(ignore: true)
  @override
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      __$$_TimetableCopyWithImpl<_$_Timetable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimetableToJson(
      this,
    );
  }
}

abstract class _Timetable extends Timetable {
  const factory _Timetable(
      {required final String id,
      required final String name,
      required final List<Day> days,
      required final User owner,
      required final List<User> editors,
      required final User lastEditor,
      required final DateTime creationDate,
      required final DateTime lastUpdateDate,
      required final TimetableConfig config}) = _$_Timetable;
  const _Timetable._() : super._();

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$_Timetable.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Day> get days;
  @override
  User get owner;
  @override
  List<User> get editors;
  @override
  User get lastEditor;
  @override
  DateTime get creationDate;
  @override
  DateTime get lastUpdateDate;
  @override
  TimetableConfig get config;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}
