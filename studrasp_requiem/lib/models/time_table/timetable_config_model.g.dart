// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeTableConfig _$$_TimeTableConfigFromJson(Map<String, dynamic> json) =>
    _$_TimeTableConfig(
      timeIntervals: (json['timeIntervals'] as List<dynamic>)
          .map((e) => TimeInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekTypes:
          (json['weekTypes'] as List<dynamic>).map((e) => e as String).toList(),
      lessonTypes: (json['lessonTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_TimeTableConfigToJson(_$_TimeTableConfig instance) =>
    <String, dynamic>{
      'timeIntervals': instance.timeIntervals,
      'weekTypes': instance.weekTypes,
      'lessonTypes': instance.lessonTypes,
    };
