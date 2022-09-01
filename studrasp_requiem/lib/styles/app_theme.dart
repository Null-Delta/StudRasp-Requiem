import 'package:flutter/material.dart';
import 'widget_styles.dart';
import 'time_picker_theme.dart';
import 'fonts.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData getTheme(AppColors colors) {
    final theme =
        colors is AppLightColors ? ThemeData.light() : ThemeData.dark();

    final textStyles = AppDefaultTextStyles(colors);

    return theme.copyWith(
      backgroundColor: colors.backgroundPrimary,
      scaffoldBackgroundColor: colors.backgroundPrimary,
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: colors.backgroundPrimary,
        foregroundColor: colors.accentPrimary,
        elevation: 0,
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: colors.accentPrimary,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colors.disable!.withOpacity(0.25),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
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
      ),
      splashColor: colors.separator,
      hoverColor: colors.separator,
      highlightColor: colors.backgroundSecondary,
      timePickerTheme: appPickerTheme(colors, AppDefaultTextStyles(colors)),
      extensions: [
        colors,
        textStyles,
      ],
    );
  }
}
