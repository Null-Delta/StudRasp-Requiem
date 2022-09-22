import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../styles/build_context_extension.dart';
import '../../../styles/widget_styles.dart';

class LessonPlaceholder extends ConsumerWidget {
  const LessonPlaceholder({Key? key, required this.offset}) : super(key: key);

  final int offset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    String getText() {
      switch (offset) {
        case -1:
          return 'Вчера пар не было';
        case 0:
          return 'Сегодня пар нет';
        case 1:
          return 'Завтра пар нет';
        default:
          return 'В этот день пар нет';
      }
    }

    return SizedBox(
      child: Container(
        height: 96,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: BorderRadiusStyles.large,
        ),
        child: Text(
          getText(),
          style: textStyles.label!.copyWith(
            color: colors.disable,
          ),
        ),
      ),
    );
  }
}
