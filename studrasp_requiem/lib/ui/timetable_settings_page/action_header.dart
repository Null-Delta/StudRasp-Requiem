import 'package:flutter/material.dart';

import '../../styles/build_context_extension.dart';

class ActionHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const ActionHeader({
    Key? key,
    required this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;

    return SizedBox(
      height: 42,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(title, style: textStyle.title),
            const Spacer(),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
