import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/lesson/lesson_model.dart';
import '../../../models/time_interval/time_interval_model.dart';
import '../../../providers/providers.dart';
import '../../../styles/build_context_extension.dart';
import '../../../styles/colors.dart';
import '../../../styles/widget_styles.dart';
import '../lesson_header.dart';
import '../lesson_body.dart';

enum LessonCardState { normal, current, next }

class LessonCard extends ConsumerStatefulWidget {
  final int index;
  final TimeInterval interval;
  final Lesson lesson;
  final LessonCardState state;

  const LessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.lesson,
    this.state = LessonCardState.next,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonCardState();
}

class _LessonCardState extends ConsumerState<LessonCard> {
  bool get isCurrent => widget.interval.constains(DateTime.now());

  DateTime time = DateTime.now();

  String lessonEndTime() {
    final nowMinutes = time.hour * 60 + time.minute;

    final diffMinutes = widget.interval.to.inMinutes - nowMinutes;

    if (diffMinutes > 60) {
      return "${diffMinutes ~/ 60}ч ${diffMinutes % 60}м";
    } else {
      return "$diffMinutesм";
    }
  }

  String lessonStartTime() {
    final nowMinutes = time.hour * 60 + time.minute;

    final diffMinutes = widget.interval.from.inMinutes - nowMinutes;

    if (diffMinutes > 60) {
      return "${diffMinutes ~/ 60}ч ${diffMinutes % 60}м";
    } else {
      return "$diffMinutesм";
    }
  }

  Color cardBackground(AppColors colors) {
    if (widget.state == LessonCardState.current && isCurrent) {
      return colors.accentPrimary!;
    } else {
      return colors.backgroundPrimary!;
    }
  }

  Color cardBorder(AppColors colors) {
    if (widget.state == LessonCardState.current && isCurrent) {
      return colors.accentPrimary!;
    } else {
      return colors.separator!;
    }
  }

  @override
  Widget build(BuildContext context) {
    time = ref.watch(currentDate);

    final colors = context.colors;
    final textStyles = context.textStyles;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyles.large,
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
              index: widget.index,
              interval: widget.interval,
              suffix: Text(
                widget.state == LessonCardState.current && isCurrent
                    ? "До конца: ${lessonEndTime()}"
                    : widget.state == LessonCardState.next
                        ? "До начала: ${lessonStartTime()}"
                        : "",
                style: textStyles.smallLabel!.copyWith(color: colors.disable),
              ),
              state: widget.state,
            ),
          ),
          LessonBody(
            lesson: widget.lesson,
            state: widget.state,
          ),
        ],
      ),
    );
  }
}
