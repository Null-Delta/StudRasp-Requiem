import 'package:flutter/material.dart';

import '../../models/time_interval/time_interval_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../../styles/widget_styles.dart';

class LessonHeader extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Widget rightWidget;

  const LessonHeader({
    Key? key,
    required this.index,
    required this.interval,
    required this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;
    final textStyles = context.textStyles;

    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BurderRadiusStyles.large,
            color: colors.backgroundSecondary,
          ),
          child: Text(
            index.toString(),
            style: textStyles.smallLabel!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "${interval.from.inHours}:${interval.from.inMinutes % 60 >= 10 ? (interval.from.inMinutes % 60).toString() : '${interval.from.inMinutes % 60}0'} - ${interval.to.inHours}:${interval.to.inMinutes % 60 >= 10 ? (interval.to.inMinutes % 60).toString() : '${interval.to.inMinutes % 60}0'}",
          style: TextStyle(
            color: colors.disable,
          ).copyWith(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        Container(
          height: 36,
          alignment: Alignment.center,
          child: rightWidget,
        )
      ],
    );
  }
}
