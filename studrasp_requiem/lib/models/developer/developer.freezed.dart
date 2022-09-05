// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'developer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Developer {
  Image get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get gitURL => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeveloperCopyWith<Developer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperCopyWith<$Res> {
  factory $DeveloperCopyWith(Developer value, $Res Function(Developer) then) =
      _$DeveloperCopyWithImpl<$Res>;
  $Res call(
      {Image image,
      String name,
      String email,
      String description,
      String gitURL});
}

/// @nodoc
class _$DeveloperCopyWithImpl<$Res> implements $DeveloperCopyWith<$Res> {
  _$DeveloperCopyWithImpl(this._value, this._then);

  final Developer _value;
  // ignore: unused_field
  final $Res Function(Developer) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? gitURL = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gitURL: gitURL == freezed
          ? _value.gitURL
          : gitURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DeveloperCopyWith<$Res> implements $DeveloperCopyWith<$Res> {
  factory _$$_DeveloperCopyWith(
          _$_Developer value, $Res Function(_$_Developer) then) =
      __$$_DeveloperCopyWithImpl<$Res>;
  @override
  $Res call(
      {Image image,
      String name,
      String email,
      String description,
      String gitURL});
}

/// @nodoc
class __$$_DeveloperCopyWithImpl<$Res> extends _$DeveloperCopyWithImpl<$Res>
    implements _$$_DeveloperCopyWith<$Res> {
  __$$_DeveloperCopyWithImpl(
      _$_Developer _value, $Res Function(_$_Developer) _then)
      : super(_value, (v) => _then(v as _$_Developer));

  @override
  _$_Developer get _value => super._value as _$_Developer;

  @override
  $Res call({
    Object? image = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? description = freezed,
    Object? gitURL = freezed,
  }) {
    return _then(_$_Developer(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gitURL: gitURL == freezed
          ? _value.gitURL
          : gitURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Developer implements _Developer {
  _$_Developer(
      {required this.image,
      required this.name,
      required this.email,
      required this.description,
      required this.gitURL});

  @override
  final Image image;
  @override
  final String name;
  @override
  final String email;
  @override
  final String description;
  @override
  final String gitURL;

  @override
  String toString() {
    return 'Developer(image: $image, name: $name, email: $email, description: $description, gitURL: $gitURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Developer &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.gitURL, gitURL));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(gitURL));

  @JsonKey(ignore: true)
  @override
  _$$_DeveloperCopyWith<_$_Developer> get copyWith =>
      __$$_DeveloperCopyWithImpl<_$_Developer>(this, _$identity);
}

abstract class _Developer implements Developer {
  factory _Developer(
      {required final Image image,
      required final String name,
      required final String email,
      required final String description,
      required final String gitURL}) = _$_Developer;

  @override
  Image get image;
  @override
  String get name;
  @override
  String get email;
  @override
  String get description;
  @override
  String get gitURL;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperCopyWith<_$_Developer> get copyWith =>
      throw _privateConstructorUsedError;
}
