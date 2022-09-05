// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
      isRegistered: json['isRegistered'] as bool? ?? false,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'isRegistered': instance.isRegistered,
      'photoURL': instance.photoURL,
    };
