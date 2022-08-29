import 'lesson_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_model.freezed.dart';
part 'day_model.g.dart';

@freezed
class Day with _$Day {
  const Day._();

  const factory Day({
    required List<Lesson> lessons,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
