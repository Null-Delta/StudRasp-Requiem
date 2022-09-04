// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_interval_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeInterval _$$_TimeIntervalFromJson(Map<String, dynamic> json) =>
    _$_TimeInterval(
      from: Duration(microseconds: json['from'] as int),
      to: Duration(microseconds: json['to'] as int),
    );

Map<String, dynamic> _$$_TimeIntervalToJson(_$_TimeInterval instance) =>
    <String, dynamic>{
      'from': instance.from.inMicroseconds,
      'to': instance.to.inMicroseconds,
    };
