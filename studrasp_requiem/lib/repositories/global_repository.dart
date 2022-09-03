import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/timetable/timetable_model.dart';

abstract class TimetableGlobalSavesRepository {
  Future<void> initRepository();

  Future<Timetable?> loadTimetableOnId(String id);
  Future<void> saveTimetable(Timetable timetable);

  Future<Timetable?> loadTimetableList();
}

class TimetableGlobalSavesRepositoryImpl
    implements TimetableGlobalSavesRepository {
  @override
  Future<void> initRepository() async {}

  @override
  Future<Timetable?> loadTimetableList() async {
    FirebaseFirestore.instance.collection('timetables');
    return null;
  }

  @override
  Future<Timetable?> loadTimetableOnId(String id) async {
    return null;
  }

  @override
  Future<void> saveTimetable(Timetable timetable) async {
    try {
      Map<String, dynamic> tmp = jsonDecode(jsonEncode(timetable.toJson()));
      final ast =
          await FirebaseFirestore.instance.collection('timetables').add(tmp);
    } on FirebaseException catch (e) {
      print(e.message);
    } catch (e) {
      print(1);
    }
  }
}
