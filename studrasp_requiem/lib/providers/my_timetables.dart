import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/timetable/timetable_model.dart';
import '../models/user/user_model.dart';
import '../repositories/global_repository.dart';
import 'current_timetable.dart';
import 'providers.dart';
import 'user_auth.dart';

final myTimetables =
    StateNotifierProvider<MyTimetablesNotifier, List<Timetable>>((ref) {
  return MyTimetablesNotifier(
    [],
    timetableGlobalSavesRepository: ref.read(globalRepositoryStore),
    localRepository: ref.read(localStorage.notifier),
    appUser: ref.watch(userAuth),
  );
});

class MyTimetablesNotifier extends StateNotifier<List<Timetable>> {
  MyTimetablesNotifier(
    super.state, {
    required this.timetableGlobalSavesRepository,
    required this.localRepository,
    required this.appUser,
  }) {
    update();
  }
  final TimetableGlobalSavesRepository timetableGlobalSavesRepository;
  final LocalStorageNotifier localRepository;
  final AppUser appUser;

  Future<void> save(Timetable timetable) async {
    await timetableGlobalSavesRepository.saveTimetable(timetable);
    if (localRepository.state.currentTimetable?.id != null &&
        timetable.id == localRepository.state.currentTimetable!.id) {
      localRepository.save(timetable);
    }
    update();
  }

  Future<void> update() async {
    state =
        await timetableGlobalSavesRepository.getOwnedTimetables(appUser.id) ??
            [];
  }
}
