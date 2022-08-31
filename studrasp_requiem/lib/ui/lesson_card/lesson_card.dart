import 'package:flutter/material.dart';
import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../styles/button_style.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../../styles/widget_styles.dart';
import 'lesson_header.dart';
import 'lesson_body.dart';

class LessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Lesson lesson;
  final bool isEditable;

  const LessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.lesson,
    this.isEditable = false,
  }) : super(key: key);

  Color cardBackground(AppColors colors) {
    if (interval.constains(DateTime.now())) {
      return colors.accentPrimary!;
    } else {
      return colors.backgroundPrimary!;
    }
  }

  Color cardBorder(AppColors colors) {
    if (interval.constains(DateTime.now())) {
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
            padding: EdgeInsets.only(left: 12, top: 6, bottom: 0, right: isEditable ? 6 : 12),
            child: LessonHeader(
              index: index,
              interval: interval,
              rightWidget: !isEditable
                  ? Text(
                      "До конца: 9:00",
                      style: textStyles.smallLabel!.copyWith(color: colors.disable),
                    )
                  : ElevatedButton(
                      style: plainButton(colors).copyWith(
                        foregroundColor: MaterialStateProperty.all(
                          interval.constains(DateTime.now()) ? colors.backgroundPrimary : colors.accentPrimary,
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.abc),
                    ),
            ),
          ),
          LessonBody(
            lesson: lesson,
            isCurrent: interval.constains(DateTime.now()),
          ),
        ],
      ),
    );
  }
}
