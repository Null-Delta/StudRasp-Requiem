import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDate = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final selectedDuration = StateProvider<Duration>((ref) {
  return Duration(milliseconds: DateTime.now().millisecondsSinceEpoch);
});
