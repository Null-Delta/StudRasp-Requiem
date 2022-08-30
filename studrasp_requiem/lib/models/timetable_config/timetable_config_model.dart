import 'package:freezed_annotation/freezed_annotation.dart';

import '../time_interval/time_interval_model.dart';

part 'timetable_config_model.freezed.dart';
part 'timetable_config_model.g.dart';

@freezed
class TimeTableConfig with _$TimeTableConfig {
  const factory TimeTableConfig({
    required List<TimeInterval> timeIntervals,
    required List<String> weekTypes,
    required List<String> lessonTypes,
  }) = _TimeTableConfig;

  factory TimeTableConfig.fromJson(Map<String, dynamic> json) =>
      _$TimeTableConfigFromJson(json);
}
