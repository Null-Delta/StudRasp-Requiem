import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/timetable/timetable_model.dart';
import '../support/logger.dart';

abstract class TimetableGlobalSavesRepository {
  Future<List<Timetable>?> getTimetablesOnId(List<String> timetableIdList);

  Future<List<Timetable>?> getEditableTimetables(String userId);

  Future<List<Timetable>?> getOwnedTimetables(String userId);

  Future<List<Timetable>?> getSearchedTimetables(String searchName);

  Future<void> saveTimetable(Timetable timetable);

  Future<void> deleteTimetable(String timetableId);

  Future<void> saveNewUser(String email, String login);

  Future<String?> getUserEmailByLogin(String login);
}

class TimetableGlobalSavesRepositoryImpl
    implements TimetableGlobalSavesRepository {
  @override
  Future<void> deleteTimetable(String timetableId) async {
    try {
      var timetableList = await FirebaseFirestore.instance
          .collection('timetables')
          .where('id', isEqualTo: timetableId)
          .get();
      if (timetableList.docs.isEmpty) {
        logger.severe('Таблица не найдена');
        throw Error();
      } else if (timetableList.docs.length == 1) {
        await FirebaseFirestore.instance
            .collection('timetables')
            .doc(timetableList.docs[0].id)
            .delete();
      } else {
        logger.severe('Повторяющиеся ID таблиц');
        throw Error();
      }
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
  }

  @override
  Future<List<Timetable>?> getEditableTimetables(String userId) async {
    try {
      var timetableList =
          await FirebaseFirestore.instance.collection('timetables').get();
      return List.from(
        timetableList.docs.map((e) {
          Timetable timetable = Timetable.fromJson(e.data());
          if (timetable.editors
              .where((element) => element.id == userId)
              .isEmpty) {
            return null;
          } else {
            return timetable;
          }
        }),
      );
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
    return null;
  }

  @override
  Future<List<Timetable>?> getOwnedTimetables(String userId) async {
    try {
      var timetableList = await FirebaseFirestore.instance
          .collection('timetables')
          .where('owner.id', isEqualTo: userId)
          .get();
      return List.from(
        timetableList.docs.map((e) => Timetable.fromJson(e.data())),
      );
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
    return null;
  }

  @override
  Future<List<Timetable>?> getSearchedTimetables(String searchName) async {
    try {
      var timetableList = await FirebaseFirestore.instance
          .collection('timetables')
          .where('name', isEqualTo: searchName)
          .get();
      return List.from(
        timetableList.docs.map((e) => Timetable.fromJson(e.data())),
      );
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
    return null;
  }

  @override
  Future<List<Timetable>?> getTimetablesOnId(
    List<String> timetableIdList,
  ) async {
    try {
      var timetableList = await FirebaseFirestore.instance
          .collection('timetables')
          .where('id', whereIn: timetableIdList)
          .get();
      if (timetableList.docs.isEmpty) {
        logger.severe('Таблицы не найдены');
        throw Error();
      } else {
        return List.from(
          timetableList.docs.map((e) => Timetable.fromJson(e.data())),
        );
      }
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
    return null;
  }

  @override
  Future<void> saveTimetable(Timetable timetable) async {
    try {
      Map<String, dynamic> json = jsonDecode(jsonEncode(timetable.toJson()));
      var timetableList = await FirebaseFirestore.instance
          .collection('timetables')
          .where('id', isEqualTo: timetable.id)
          .get();
      if (timetableList.docs.isEmpty) {
        await FirebaseFirestore.instance.collection('timetables').add(json);
      } else if (timetableList.docs.length == 1) {
        await FirebaseFirestore.instance
            .collection('timetables')
            .doc(timetableList.docs[0].id)
            .update(json);
      } else {
        logger.severe('Повторяющиеся ID таблиц');
        throw Error();
      }
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
  }

  @override
  Future<void> saveNewUser(
    String email,
    String login,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .add({'email': email, 'login': login});
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
  }

  @override
  Future<String?> getUserEmailByLogin(String login) async {
    try {
      var usersList = await FirebaseFirestore.instance
          .collection('users')
          .where('login', isEqualTo: login)
          .get();
      return usersList.docs[0].get('email');
    } on FirebaseException catch (e) {
      logger.severe(e.message);
    } catch (e) {
      logger.severe(e);
    }
    return null;
  }
}
