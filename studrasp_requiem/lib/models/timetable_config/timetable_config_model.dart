import 'package:freezed_annotation/freezed_annotation.dart';

import '../time_interval/time_interval_model.dart';

part 'timetable_config_model.freezed.dart';
part 'timetable_config_model.g.dart';

@freezed
class TimetableConfig with _$TimetableConfig {
  const TimetableConfig._();

  const factory TimetableConfig({
    required List<TimeInterval> timeIntervals,
    required List<String> weekTypes,
    required List<String> lessonTypes,
  }) = _TimeTableConfig;

  factory TimetableConfig.fromJson(Map<String, dynamic> json) =>
      _$TimetableConfigFromJson(json);

  factory TimetableConfig.empty() => TimetableConfig(
        timeIntervals: [
          for (int i = 0; i < 8; i++)
            TimeInterval(
              from: Duration(hours: 8 + i),
              to: Duration(hours: 9 + i),
            ),
        ],
        weekTypes: ['Первая', 'Вторая'],
        lessonTypes: ['Лекция', 'Практика'],
      );
}
