import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';
import '../../../styles/build_context_extension.dart';

class EditorCard extends StatelessWidget {
  final AppUser user;
  final Widget? action;
  final Function() onTap;

  const EditorCard({
    Key? key,
    required this.user,
    required this.onTap,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ColoredBox(
        color: colors.backgroundPrimary!,
        child: Padding(
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
                if (action != null) action!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
