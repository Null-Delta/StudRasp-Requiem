import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? hint;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;
    final colors = Theme.of(context).extension<AppColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label!,
              style: textStyles.subtitle,
            ),
          ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: onTap != null
                ? Material(
                    color: Colors.transparent,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 22,
                      onPressed: onTap,
                      icon: Assets.images.command.svg(
                        color: colors.accentPrimary,
                      ),
                    ),
                  )
                : null,
          ),
        )
      ],
    );
  }
}
