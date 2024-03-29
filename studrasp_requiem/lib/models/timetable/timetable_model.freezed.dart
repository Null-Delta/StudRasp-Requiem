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
  AppUser get owner => throw _privateConstructorUsedError;
  List<AppUser> get editors => throw _privateConstructorUsedError;
  AppUser get lastEditor => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  DateTime get lastUpdateDate => throw _privateConstructorUsedError;
  TimetableConfig get config => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;

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
      AppUser owner,
      List<AppUser> editors,
      AppUser lastEditor,
      DateTime creationDate,
      DateTime lastUpdateDate,
      TimetableConfig config,
      bool isPublished});

  $AppUserCopyWith<$Res> get owner;
  $AppUserCopyWith<$Res> get lastEditor;
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
    Object? isPublished = freezed,
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
              as AppUser,
      editors: editors == freezed
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<AppUser>,
      lastEditor: lastEditor == freezed
          ? _value.lastEditor
          : lastEditor // ignore: cast_nullable_to_non_nullable
              as AppUser,
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
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get owner {
    return $AppUserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }

  @override
  $AppUserCopyWith<$Res> get lastEditor {
    return $AppUserCopyWith<$Res>(_value.lastEditor, (value) {
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
      AppUser owner,
      List<AppUser> editors,
      AppUser lastEditor,
      DateTime creationDate,
      DateTime lastUpdateDate,
      TimetableConfig config,
      bool isPublished});

  @override
  $AppUserCopyWith<$Res> get owner;
  @override
  $AppUserCopyWith<$Res> get lastEditor;
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
    Object? isPublished = freezed,
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
              as AppUser,
      editors: editors == freezed
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<AppUser>,
      lastEditor: lastEditor == freezed
          ? _value.lastEditor
          : lastEditor // ignore: cast_nullable_to_non_nullable
              as AppUser,
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
      isPublished: isPublished == freezed
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required final List<AppUser> editors,
      required this.lastEditor,
      required this.creationDate,
      required this.lastUpdateDate,
      required this.config,
      required this.isPublished})
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
  final AppUser owner;
  final List<AppUser> _editors;
  @override
  List<AppUser> get editors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  final AppUser lastEditor;
  @override
  final DateTime creationDate;
  @override
  final DateTime lastUpdateDate;
  @override
  final TimetableConfig config;
  @override
  final bool isPublished;

  @override
  String toString() {
    return 'Timetable(id: $id, name: $name, days: $days, owner: $owner, editors: $editors, lastEditor: $lastEditor, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, config: $config, isPublished: $isPublished)';
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
            const DeepCollectionEquality().equals(other.config, config) &&
            const DeepCollectionEquality()
                .equals(other.isPublished, isPublished));
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
      const DeepCollectionEquality().hash(config),
      const DeepCollectionEquality().hash(isPublished));

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
      required final AppUser owner,
      required final List<AppUser> editors,
      required final AppUser lastEditor,
      required final DateTime creationDate,
      required final DateTime lastUpdateDate,
      required final TimetableConfig config,
      required final bool isPublished}) = _$_Timetable;
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
  AppUser get owner;
  @override
  List<AppUser> get editors;
  @override
  AppUser get lastEditor;
  @override
  DateTime get creationDate;
  @override
  DateTime get lastUpdateDate;
  @override
  TimetableConfig get config;
  @override
  bool get isPublished;
  @override
  @JsonKey(ignore: true)
  _$$_TimetableCopyWith<_$_Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}
