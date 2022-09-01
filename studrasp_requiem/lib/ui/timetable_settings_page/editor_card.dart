import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../models/user/user_model.dart';
import '../../styles/build_context_extension.dart';

class EditorCard extends StatelessWidget {
  final User user;

  const EditorCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
                border: Border.all(color: colors.separator!, width: 1),
              ),
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
            IconButton(
              onPressed: () {},
              icon: Assets.images.trashFull.svg(
                color: colors.destructive,
                width: 20,
                height: 20,
              ),
              iconSize: 24,
              splashRadius: 24,
            ),
          ],
        ),
      ),
    );
  }
}
