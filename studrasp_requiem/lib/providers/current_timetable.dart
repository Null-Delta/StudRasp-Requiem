import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/timetable/timetable_model.dart';
import '../models/user/user_model.dart';
import '../repositories/current_timetable_repository.dart';

final currentTimetable =
    StateNotifierProvider<CurrentTimetableNotifier, Timetable?>((ref) {
  return CurrentTimetableNotifier(null);
});

class CurrentTimetableNotifier extends StateNotifier<Timetable?> {
  late final CurrentTimetableRepository currentTimetableRepository;
  CurrentTimetableNotifier(super.state) {
    _init();
  }

  Future<void> _init() async {
    currentTimetableRepository = CurrentTimetableRepositorySPImpl();
    load();
  }

  void load() {
    Timetable? loadedTimetable = currentTimetableRepository.loadCurrent();
    if (loadedTimetable != null) {
      state = loadedTimetable;
    }
  }

  void save(Timetable timetable) {
    currentTimetableRepository.saveCurrent(timetable);
  }
}
