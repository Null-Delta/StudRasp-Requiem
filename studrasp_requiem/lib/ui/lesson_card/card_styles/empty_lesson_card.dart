import 'package:flutter/material.dart';

import '../../../models/time_interval/time_interval_model.dart';
import '../../../styles/button_style.dart';
import '../../../styles/colors.dart';
import '../../../styles/widget_styles.dart';
import '../lesson_header.dart';

class EmptyLessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Function onTap;

  const EmptyLessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.onTap,
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
        padding: const EdgeInsets.only(left: 12, right: 6, top: 6, bottom: 6),
        child: LessonHeader(
          index: index,
          interval: interval,
          rightWidget: ElevatedButton(
            style: plainButton(colors),
            onPressed: () {},
            child: const Icon(Icons.abc),
          ),
        ),
      ),
    );
  }
}
