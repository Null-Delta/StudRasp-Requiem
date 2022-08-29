import 'package:studrasp_requiem/models/user_model.dart';

import 'day_model.dart';

class TimeTable {
  String id = "";

  List<Day> days = [];

  User owner = User();
  List<User> editors = [];
  User lastEditor = User();

  DateTime creationDate = DateTime.now();
  DateTime lastUpdateDate = DateTime.now();
}
