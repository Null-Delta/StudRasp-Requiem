import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_model.dart';

import 'day_model.dart';

part 'timetable_model.freezed.dart';
part 'timetable_model.g.dart';

@freezed
class TimeTable with _$TimeTable {
  const factory TimeTable({
    required String id,
    required String name,
    required List<Day> days,
    required User owner,
    required List<User> editors,
    required User lastEditor,
    required DateTime creationDate,
    required DateTime lastUpdateDate,
  }) = _TimeTable;

  factory TimeTable.fromJson(Map<String, dynamic> json) =>
      _$TimeTableFromJson(json);
}
