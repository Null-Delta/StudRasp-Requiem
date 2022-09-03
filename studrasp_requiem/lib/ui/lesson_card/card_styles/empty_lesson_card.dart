import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../models/time_interval/time_interval_model.dart';
import '../../../styles/build_context_extension.dart';
import '../../../styles/widget_styles.dart';
import '../lesson_header.dart';

class EmptyLessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;
  final Function? onTap;
  final String? text;

  const EmptyLessonCard({
    Key? key,
    required this.index,
    required this.interval,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: BorderRadiusStyles.large,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
          child: LessonHeader(
            index: index,
            interval: interval,
            suffix: onTap != null
                ? text != null
                    ? Text(
                        text!,
                        style: textStyles.smallLabel!.copyWith(
                          color: colors.disable,
                        ),
                      )
                    : Container(
                        child: Assets.images.iconPlusOutline.svg(
                          color: colors.accentPrimary,
                          height: 24,
                          width: 24,
                        ),
                      )
                : null,
          ),
        ),
      ),
    );
  }
}
