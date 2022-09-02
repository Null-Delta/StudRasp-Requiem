import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/lesson/lesson_model.dart';
import '../models/timetable/timetable_model.dart';
import '../models/user/user_model.dart';
import '../ui/widgets/day_button.dart';

final currentDate = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final selectedDuration = StateProvider<Duration>((ref) {
  return const Duration(milliseconds: 0);
});

final currentTimetable = StateProvider<Timetable>((ref) {
  return Timetable.empty(AppUser.empty());
});

final currentUser = StateProvider<AppUser>((ref) {
  return AppUser.empty();
});

final currentEditingLesson = StateProvider<Lesson>((ref) {
  return const Lesson(name: '', type: '', teacher: '', audience: '');
});

final editorCopiedLesson = StateProvider<Lesson?>((ref) {
  return null;
});

final currentEditingTimetable = StateProvider<Timetable>((ref) {
  return Timetable.empty(AppUser.empty());
});

final selectedDay = Provider<int>((ref) {
  final currentDay = ref.watch(currentDate);
  int weekValue = ref.watch(selectedDuration).inDays + currentDay.weekday - 1;
  if (weekValue >= 14) {
    weekValue = currentDay.weekday - 1;
  }
  return weekValue;
});

final dayButtonStyleProvider =
    Provider.family.autoDispose<DayButtonStyle, Duration>((ref, duration) {
  if (duration.inDays == ref.watch(selectedDuration).inDays) {
    return DayButtonStyle.selected;
  }

  final now = DateTime.now().millisecondsSinceEpoch;

  final buttonDays =
      Duration(milliseconds: now + duration.inMilliseconds).inDays;

  final currentdays = Duration(milliseconds: now).inDays;

  if (buttonDays == currentdays) {
    return DayButtonStyle.highlighted;
  }

  return DayButtonStyle.defalut;
});
