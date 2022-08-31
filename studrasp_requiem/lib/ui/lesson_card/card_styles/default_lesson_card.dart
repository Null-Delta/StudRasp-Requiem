import 'package:flutter/material.dart';
import '../../../models/lesson/lesson_model.dart';
import '../../../models/time_interval/time_interval_model.dart';
import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';
import '../../../styles/widget_styles.dart';
import '../lesson_header.dart';
import '../lesson_body.dart';

class LessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Lesson lesson;

  const LessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.lesson,
  }) : super(key: key);

  bool get isCurrent => interval.constains(DateTime.now());

  Color cardBackground(AppColors colors) {
    if (isCurrent) {
      return colors.accentPrimary!;
    } else {
      return colors.backgroundPrimary!;
    }
  }

  Color cardBorder(AppColors colors) {
    if (isCurrent) {
      return colors.accentPrimary!;
    } else {
      return colors.separator!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BurderRadiusStyles.large,
        border: Border.all(color: cardBorder(colors), width: 1),
        color: cardBackground(colors),
        boxShadow: [
          BoxShadow(
            color: colors.shadow!,
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6, bottom: 0, right: 12),
            child: LessonHeader(
              index: index,
              interval: interval,
              rightWidget: Text(
                isCurrent ? "До конца: 9:00" : "",
                style: textStyles.smallLabel!.copyWith(color: colors.disable),
              ),
            ),
          ),
          LessonBody(
            lesson: lesson,
            isCurrent: isCurrent,
          ),
        ],
      ),
    );
  }
}
