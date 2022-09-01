import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;

  final double padding;

  const LabeledText({
    Key? key,
    required this.label,
    required this.text,
    this.padding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return SizedBox(
      height: 42,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Row(
          children: [
            Text(
              label,
              style: textStyles.label!.copyWith(color: colors.disable),
            ),
            const Spacer(),
            Text(
              text,
              style: textStyles.label,
            ),
          ],
        ),
      ),
    );
  }
}
