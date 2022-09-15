import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/timetable/timetable_model.dart';
import '../repositories/current_timetable_repository.dart';

class LocalStorageModel {
  Timetable? currentTimetable;
  List<String> savedTimetables = [];

  LocalStorageModel(this.currentTimetable, this.savedTimetables);

  copyWith({
    Timetable? currentTimetable,
    List<String>? savedTimetables,
  }) {
    return LocalStorageModel(
      currentTimetable ?? this.currentTimetable,
      savedTimetables ?? this.savedTimetables,
    );
  }
}

final localStorage = StateNotifierProvider<LocalStorageNotifier, LocalStorageModel>((ref) {
  return LocalStorageNotifier(LocalStorageModel(null, []));
});

class LocalStorageNotifier extends StateNotifier<LocalStorageModel> {
  late final LocalStorageRepository localStorageRepository;
  LocalStorageNotifier(super.state) {
    _init();
  }

  Future<void> _init() async {
    localStorageRepository = CurrentLocalStoragePImpl();
    load();
  }

  void load() async {
    Timetable? loadedTimetable = await localStorageRepository.loadCurrent();
    List<String> savedTimetables = await localStorageRepository.savedTimetables();
    state = state.copyWith(
      currentTimetable: loadedTimetable,
      savedTimetables: savedTimetables,
    );
  }

  void save(Timetable? timetable) {
    localStorageRepository.saveCurrent(timetable);
    log(timetable.toString());
    state = state.copyWith(currentTimetable: timetable);
  }

  void addToSavedTimeTables(String timetableId) {
    localStorageRepository.addToSaved(timetableId);
    state = state.copyWith(savedTimetables: [...state.savedTimetables, timetableId]);
  }

  void removeFromSavedTimeTables(String timetableId) {
    localStorageRepository.removeFromSaved(timetableId);
    state = state.copyWith(
      savedTimetables: state.savedTimetables.where((id) => id != timetableId).toList(),
    );
  }
}
