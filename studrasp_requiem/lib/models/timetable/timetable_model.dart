import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../day/day_model.dart';
import '../lesson/lesson_model.dart';
import '../timetable_config/timetable_config_model.dart';
import '../user/user_model.dart';

part 'timetable_model.freezed.dart';
part 'timetable_model.g.dart';

@freezed
class Timetable with _$Timetable {
  const Timetable._();

  const factory Timetable({
    required String id,
    required String name,
    required List<Day> days,
    required AppUser owner,
    required List<AppUser> editors,
    required AppUser lastEditor,
    required DateTime creationDate,
    required DateTime lastUpdateDate,
    required TimetableConfig config,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson(json);

  //нужно получение данного пользователя
  factory Timetable.empty(AppUser user) {
    return Timetable(
      id: '',
      name: 'Новое расписание',
      days: [for (int i = 0; i < 14; i++) Day.empty()],
      owner: user,
      editors: [],
      lastEditor: user,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
      config: TimetableConfig.empty(),
    );
  }

  factory Timetable.random(AppUser user) {
    return Timetable(
      id: '',
      name: 'Random name',
      days: [
        for (int i = 0; i < 14; i++)
          Day(
            lessons: [
              for (int i = 0; i < 8; i++)
                if (Random().nextInt(2) == 0) Lesson.random() else Lesson.empty()
            ],
          )
      ],
      owner: user,
      editors: [],
      lastEditor: user,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
      config: TimetableConfig.empty(),
    );
  }
}
