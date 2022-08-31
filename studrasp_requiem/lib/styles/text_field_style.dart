import 'package:flutter/material.dart';
import 'package:studrasp_requiem/styles/widget_styles.dart';

import 'build_context_extension.dart';

InputDecoration textFieldDecoration(BuildContext context) {
  final colors = context.colors;
  final textStyles = context.textStyles;

  return InputDecoration(
    hintStyle: textStyles.label!.copyWith(color: colors.disable),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    filled: true,
    fillColor: colors.backgroundSecondary,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: colors.separator!, width: 1),
      borderRadius: BurderRadiusStyles.normal,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colors.separator!, width: 1),
      borderRadius: BurderRadiusStyles.normal,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colors.separator!, width: 1),
      borderRadius: BurderRadiusStyles.normal,
    ),
  );
}
