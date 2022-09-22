import 'package:flutter/material.dart';

import '../../models/lesson/lesson_model.dart';
import '../../styles/build_context_extension.dart';
import 'card_styles/lesson_card.dart';

class LessonBody extends StatelessWidget {
  final Lesson lesson;
  final LessonCardState state;

  const LessonBody({
    Key? key,
    required this.lesson,
    required this.state,
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
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.subtitle!.copyWith(
                    color: state == LessonCardState.current ? colors.backgroundPrimary : colors.accentPrimary,
                  ),
                ),
              ),
            ],
          ),
          if (lesson.audience != '' || lesson.type != '' || lesson.teacher != '')
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  if (lesson.audience != '' || lesson.type != '')
                    Text(
                      '${lesson.audience} ${lesson.audience != '' && lesson.type != '' ? '•' : ''} ${lesson.type}',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: textStyles.smallLabel!.copyWith(
                        color: colors.disable,
                      ),
                    ),
                  const Spacer(),
                  if (lesson.teacher != '')
                    Text(
                      lesson.teacher,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: textStyles.smallLabel!.copyWith(
                        color: colors.disable,
                      ),
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
