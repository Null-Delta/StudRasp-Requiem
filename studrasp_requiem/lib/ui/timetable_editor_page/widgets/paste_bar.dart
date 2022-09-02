import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../styles/build_context_extension.dart';
import '../../../styles/button_style.dart';
import '../../lesson_card/lesson_body.dart';

class PasteBar extends ConsumerStatefulWidget {
  const PasteBar({Key? key}) : super(key: key);

  @override
  ConsumerState<PasteBar> createState() => _PasteBarState();
}

class _PasteBarState extends ConsumerState<PasteBar> {
  void clearCopiedLesson() {
    ref.read(editorCopiedLesson.notifier).update(
          (state) => null,
        );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    final lesson = ref.read(editorCopiedLesson);

    return Column(
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: colors.separator,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
          child: SizedBox(
            height: 36,
            child: Row(
              children: [
                Text(
                  "Копирование пары",
                  style: textStyles.label!.copyWith(color: colors.disable),
                ),
                const Spacer(),
                TextButton(
                  style: plainButton(colors, size: const Size(80, 36)).copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      colors.accentPrimary,
                    ),
                  ),
                  onPressed: () {
                    clearCopiedLesson();
                  },
                  child: Text(
                    "Готово",
                    style: textStyles.subtitle!.copyWith(
                      color: colors.backgroundPrimary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: LessonBody(lesson: lesson!, isCurrent: false),
        ),
      ],
    );
  }
}
