import 'package:flutter/material.dart';

import '../../../models/lesson/lesson_model.dart';
import '../../../models/time_interval/time_interval_model.dart';
import '../../../styles/build_context_extension.dart';
import '../../../styles/widget_styles.dart';
import '../../widgets/popup_menu_action.dart';
import '../lesson_body.dart';
import '../lesson_header.dart';

class EditableLessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Lesson lesson;
  final List<PopupMenuAction> actions;

  const EditableLessonCard({
    Key? key,
    required this.index,
    required this.interval,
    required this.lesson,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BurderRadiusStyles.large,
        border: Border.all(color: colors.separator!, width: 1),
        color: colors.backgroundPrimary,
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
            padding: const EdgeInsets.only(left: 12, right: 6, top: 6, bottom: 0),
            child: LessonHeader(
              index: index,
              interval: interval,
              rightWidget: PopupMenuButton<String>(
                itemBuilder: (context) {
                  return actions
                      .map(
                        (action) => PopupMenuItem(
                          value: action.text,
                          height: 48,
                          onTap: action.action,
                          child: action,
                        ),
                      )
                      .toList();
                },
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                position: PopupMenuPosition.under,
                iconSize: 24,
                color: colors.backgroundPrimary,
                elevation: 16,
                splashRadius: 1,
                icon: Icon(
                  Icons.abc,
                  color: colors.accentPrimary,
                ),
                constraints: const BoxConstraints(minWidth: 256),
              ),
            ),
          ),
          LessonBody(lesson: lesson, isCurrent: false),
        ],
      ),
    );
  }
}
