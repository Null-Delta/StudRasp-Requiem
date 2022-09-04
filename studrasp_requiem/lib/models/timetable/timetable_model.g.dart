// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timetable _$$_TimetableFromJson(Map<String, dynamic> json) => _$_Timetable(
      id: json['id'] as String,
      name: json['name'] as String,
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      owner: AppUser.fromJson(json['owner'] as Map<String, dynamic>),
      editors: (json['editors'] as List<dynamic>)
          .map((e) => AppUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEditor: AppUser.fromJson(json['lastEditor'] as Map<String, dynamic>),
      creationDate: DateTime.parse(json['creationDate'] as String),
      lastUpdateDate: DateTime.parse(json['lastUpdateDate'] as String),
      config: TimetableConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TimetableToJson(_$_Timetable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'days': instance.days.map((e) => e.toJson()).toList(),
      'owner': instance.owner.toJson(),
      'editors': instance.editors.map((e) => e.toJson()).toList(),
      'lastEditor': instance.lastEditor.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate.toIso8601String(),
      'config': instance.config.toJson(),
    };
