import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/timetable/timetable_model.dart';

abstract class CurrentTimetableRepository {
  Timetable? loadCurrent();

  void saveCurrent(Timetable timetable);
}

class CurrentTimetableRepositorySPImpl implements CurrentTimetableRepository {
  @override
  Timetable? loadCurrent() {
    SharedPreferences.getInstance().then(
      (value) {
        final jsonString = value.getString('currentTimeTable');
        if (jsonString != null) {
          return Timetable.fromJson(const JsonDecoder().convert(jsonString));
        }
      },
    );
    return null;
  }

  @override
  void saveCurrent(Timetable timetable) {
    SharedPreferences.getInstance().then(
      (value) {
        value.setString('currentTimeTable', jsonEncode(timetable.toJson()));
      },
    );
  }
}
