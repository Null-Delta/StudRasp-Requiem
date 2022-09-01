import 'package:flutter/material.dart';
import 'time_picker_theme.dart';
import 'fonts.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData getTheme(AppColors colors) {
    final theme =
        colors is AppLightColors ? ThemeData.light() : ThemeData.dark();
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
      splashColor: colors.separator,
      hoverColor: colors.separator,
      highlightColor: colors.backgroundSecondary,
      timePickerTheme: appPickerTheme(colors, AppDefaultTextStyles(colors)),
      extensions: [
        colors,
        AppDefaultTextStyles(colors),
      ],
    );
  }
}
