import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/button_style.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class EditorCard extends StatelessWidget {
  final User user;

  const EditorCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;
    final textStyle = context.textStyles;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        width: 56,
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: colors.backgroundSecondary!,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                  border: Border.all(color: colors.separator!, width: 1)),
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                child: Text(
                  "JA",
                  style: textStyle.subtitle!.copyWith(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              user.name,
              style: textStyle.label,
            ),
            const Spacer(),
            ElevatedButton(
              style: plainButton(colors, size: const Size(42, 42)),
              onPressed: () {
                // TODO: delete editor
              },
              child: Icon(
                Icons.delete_outline_rounded,
                color: colors.destructive,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
