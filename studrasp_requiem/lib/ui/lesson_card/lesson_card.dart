import 'package:flutter/material.dart';
import '../../models/lesson/lesson_model.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../../styles/widget_styles.dart';
import '../../support/date_time_converter.dart';

class LessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Lesson lesson;
  final bool isEditable;
  final bool showDeadline;

  const LessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.lesson,
    this.isEditable = false,
    this.showDeadline = false,
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

  Color lessonTitle(AppColors colors) {
    if (interval.constains(DateTime.now())) {
      return colors.backgroundPrimary!;
    } else {
      return colors.accentPrimary!;
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
          LessonCardTitle(
            index: index,
            interval: interval,
            isEditable: isEditable,
            showDeadline: showDeadline,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        lesson.name,
                        textAlign: TextAlign.left,
                        style: textStyles.subtitle!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "${lesson.audience} • ${lesson.type}",
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: textStyles.smallLabel!.copyWith(color: colors.disable),
                    ),
                    const Spacer(),
                    Text(
                      lesson.teacher,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: colors.disable,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LessonCardTitle extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final bool isEditable;
  final bool showDeadline;

  const LessonCardTitle({
    Key? key,
    required this.index,
    required this.interval,
    required this.isEditable,
    required this.showDeadline,
  }) : super(key: key);

  EdgeInsets get titlePadding {
    return !isEditable
        ? const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6)
        : const EdgeInsets.only(left: 12, top: 6, bottom: 0, right: 6);
  }

  BoxDecoration indexDecorator(AppColors colors) {
    return BoxDecoration(
      borderRadius: BurderRadiusStyles.large,
      color: interval.constains(DateTime.now()) ? colors.backgroundPrimary : colors.backgroundSecondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Padding(
      padding: titlePadding,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: indexDecorator(colors),
            child: Text(
              index.toString(),
              style: textStyles.smallLabel!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${interval.from.stringTime} - ${interval.to.stringTime}",
            style: TextStyle(
              color: colors.disable,
            ).copyWith(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
          if (isEditable)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: colors.accentPrimary!,
                onSurface: colors.backgroundSecondary!,
                surfaceTintColor: colors.backgroundSecondary!,
                fixedSize: const Size(36, 36),
                minimumSize: const Size(36, 36),
                maximumSize: const Size(36, 36),
                elevation: 0,
                padding: const EdgeInsets.all(0),
                shadowColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Icon(Icons.abc, size: 24),
            )
          else if (interval.constains(DateTime.now()))
            Text(
              "До конца: 1ч 15м",
              style: TextStyle(
                color: colors.disable,
              ).copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          else if (showDeadline)
            Text(
              "До начала: 1ч 15м",
              style: TextStyle(
                color: colors.disable,
              ).copyWith(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
        ],
      ),
    );
  }
}
