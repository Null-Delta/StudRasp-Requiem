import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String text;

  const LabeledText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;

    return SizedBox(
      height: 42,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
