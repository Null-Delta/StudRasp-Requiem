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
      dialogTheme: DialogTheme(
        backgroundColor: colors.backgroundPrimary,
        shape: RoundedRectangleBorder(borderRadius: BurderRadiusStyles.large),
        contentTextStyle: textStyles.label,
      ),
      colorScheme: ColorScheme.light(
        primary: colors.accentSecondary!,
        onPrimary: colors.backgroundPrimary!,
        onSurface: colors.accentPrimary!,
      ),
      disabledColor: colors.disable,
      dividerColor: colors.separator,
      unselectedWidgetColor: colors.disable,
      cardColor: colors.backgroundSecondary,
      primaryColor: colors.backgroundPrimary,
      backgroundColor: colors.backgroundPrimary,
      scaffoldBackgroundColor: colors.backgroundPrimary,
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: colors.backgroundPrimary,
        foregroundColor: colors.accentPrimary,
        elevation: 0,
        titleTextStyle: textStyles.title,
        centerTitle: true,
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: colors.accentPrimary,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: colors.disable!.withOpacity(0.25),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colors.accentPrimary,
          onPrimary: colors.backgroundPrimary,
          shadowColor: Colors.transparent,
          onSurface: colors.backgroundPrimary,
          surfaceTintColor: colors.backgroundPrimary,
          elevation: 0,
          padding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
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
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        selectedItemColor: colors.accentPrimary,
        unselectedItemColor: colors.disable,
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
