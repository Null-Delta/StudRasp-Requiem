import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../lesson_card/card_styles/default_lesson_card.dart';
import '../lesson_card/card_styles/editable_lesson_card.dart';
import 'widgets/timetable_header.dart';

import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';
import '../popup_menu_action.dart';

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
          final type = Random().nextInt(100) % 3;
          if (type == 0) {
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
          } else if (type == 1) {
            return LessonCard(
              index: index % 10,
              lesson: Lesson.random(),
              interval: TimeInterval(
                from: DateTime.now(),
                to: DateTime.now().add(
                  Duration(minutes: Random().nextInt(100) % 2 == 0 ? 1 : 0),
                ),
              ),
            );
          } else {
            return EditableLessonCard(
              index: index % 10,
              interval: TimeInterval(from: DateTime.now(), to: DateTime.now()),
              lesson: Lesson.random(),
              actions: [
                PopupMenuAction(
                  text: "Изменить",
                  icon: const Icon(Icons.edit),
                  action: () {},
                ),
                PopupMenuAction(
                  text: "Копировать пару",
                  icon: const Icon(Icons.copy),
                  action: () {},
                ),
                PopupMenuAction(
                  text: "Удалить",
                  icon: const Icon(Icons.delete),
                  action: () {},
                  style: PopupMenuActionStyle.destructive,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
