// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_interval_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeInterval _$$_TimeIntervalFromJson(Map<String, dynamic> json) =>
    _$_TimeInterval(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$$_TimeIntervalToJson(_$_TimeInterval instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
