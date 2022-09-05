import 'package:flutter/material.dart';

import '../../models/time_interval/time_interval_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';
import 'card_styles/lesson_card.dart';

class LessonHeader extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Widget? suffix;
  final String? customText;
  final LessonCardState state;

  const LessonHeader({
    Key? key,
    required this.index,
    required this.interval,
    this.suffix,
    this.state = LessonCardState.normal,
    this.customText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyles.large,
              color: state == LessonCardState.next ? colors.accentPrimary : colors.backgroundSecondary,
            ),
            child: Text(
              index.toString(),
              style: textStyles.smallLabel!.copyWith(
                fontWeight: FontWeight.bold,
                color: state == LessonCardState.next ? colors.backgroundPrimary : colors.accentPrimary,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${interval.from.inHours}:${interval.from.inMinutes % 60 >= 10 ? (interval.from.inMinutes % 60).toString() : '${interval.from.inMinutes % 60}0'} - ${interval.to.inHours}:${interval.to.inMinutes % 60 >= 10 ? (interval.to.inMinutes % 60).toString() : '${interval.to.inMinutes % 60}0'}",
            style: textStyles.smallLabel!.copyWith(
              color: colors.disable,
            ),
          ),
          const Spacer(),
          if (suffix != null) suffix!
        ],
      ),
    );
  }
}
