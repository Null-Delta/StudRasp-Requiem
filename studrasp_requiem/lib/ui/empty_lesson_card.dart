import 'package:flutter/material.dart';

import '../models/time_interval/time_interval_model.dart';
import '../styles/colors.dart';
import '../styles/widget_styles.dart';
import 'lesson_card.dart';

class EmptyLessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;

  const EmptyLessonCard({
    Key? key,
    required this.index,
    required this.interval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BurderRadiusStyles.large,
      ),
      child: Padding(
        padding: const EdgeInsets.only(),
        child: LessonCardTitle(
          index: index,
          interval: interval,
          isEditable: false,
          showDeadline: false,
        ),
      ),
    );
  }
}
