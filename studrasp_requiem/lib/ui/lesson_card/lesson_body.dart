import 'package:flutter/material.dart';

import '../../models/lesson/lesson_model.dart';
import '../../styles/build_context_extension.dart';

class LessonBody extends StatelessWidget {
  final Lesson lesson;
  final bool isCurrent;

  const LessonBody({
    Key? key,
    required this.lesson,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  lesson.name,
                  textAlign: TextAlign.left,
                  style:
                      textStyles.subtitle!.copyWith(color: isCurrent ? colors.backgroundPrimary : colors.accentPrimary),
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
                style: textStyles.smallLabel!.copyWith(
                  color: colors.disable,
                ),
              ),
              const Spacer(),
              Text(
                lesson.teacher,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: textStyles.smallLabel!.copyWith(
                  color: colors.disable,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
