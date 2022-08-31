import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/timetable/timetable_model.dart';

final currentDate = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final selectedDuration = StateProvider<Duration>((ref) {
  return Duration(milliseconds: DateTime.now().millisecondsSinceEpoch);
});

final currentTimetable = StateProvider<Timetable>((ref) {
  return Timetable.empty();
});
