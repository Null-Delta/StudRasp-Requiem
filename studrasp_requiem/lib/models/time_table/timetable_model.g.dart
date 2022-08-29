// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeTable _$$_TimeTableFromJson(Map<String, dynamic> json) => _$_TimeTable(
      id: json['id'] as String,
      name: json['name'] as String,
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      editors: (json['editors'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastEditor: User.fromJson(json['lastEditor'] as Map<String, dynamic>),
      creationDate: DateTime.parse(json['creationDate'] as String),
      lastUpdateDate: DateTime.parse(json['lastUpdateDate'] as String),
    );

Map<String, dynamic> _$$_TimeTableToJson(_$_TimeTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'days': instance.days,
      'owner': instance.owner,
      'editors': instance.editors,
      'lastEditor': instance.lastEditor,
      'creationDate': instance.creationDate.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate.toIso8601String(),
    };
