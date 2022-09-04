import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/timetable/timetable_model.dart';

abstract class LocalStorageRepository {
  Timetable? loadCurrent();
  List<String> savedTimetables();

  void saveCurrent(Timetable timetable);
  void addToSaved(String timetableId);
  void removeFromSaved(String timetableId);
}

class CurrentLocalStoragePImpl implements LocalStorageRepository {
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

  @override
  List<String> savedTimetables() {
    SharedPreferences.getInstance().then(
      (value) {
        final savedTimetables = value.getStringList('savedTimetables');
        return savedTimetables ?? [];
      },
    );
    return [];
  }

  @override
  void addToSaved(String timetableId) {
    SharedPreferences.getInstance().then(
      (value) {
        final savedTimetables = value.getStringList('savedTimetables') ?? [];
        savedTimetables.add(timetableId);
        value.setStringList('savedTimetables', savedTimetables);
      },
    );
  }

  @override
  void removeFromSaved(String timetableId) {
    SharedPreferences.getInstance().then(
      (value) {
        final savedTimetables = value.getStringList('savedTimetables') ?? [];
        savedTimetables.remove(timetableId);
        value.setStringList('savedTimetables', savedTimetables);
      },
    );
  }
}
