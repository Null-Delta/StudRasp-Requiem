import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../lesson_card/empty_lesson_card.dart';
import '../lesson_card/lesson_card.dart';
import 'widgets/timetable_header.dart';

class TimetablePage extends ConsumerStatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimetablePageState();
}

class _TimetablePageState extends ConsumerState<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Scaffold(
      appBar: const TimetableHeader(),
      backgroundColor: colors.backgroundPrimary!,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: 50,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemBuilder: (context, index) {
          if (Random().nextInt(100) % 2 == 0) {
            return EmptyLessonCard(
              index: index % 10,
              interval: TimeInterval(
                from: DateTime.now(),
                to: DateTime.now().add(
                  Duration(minutes: Random().nextInt(100) % 2 == 0 ? 1 : 0),
                ),
              ),
              onTap: () {},
            );
          } else {
            return LessonCard(
              index: index % 10,
              lesson: Lesson.random(),
              interval: TimeInterval(
                from: DateTime.now(),
                to: DateTime.now().add(
                  Duration(minutes: Random().nextInt(100) % 2 == 0 ? 1 : 0),
                ),
              ),
              isEditable: Random().nextInt(100) % 2 == 0,
            );
          }
        },
      ),
    );
  }
}
