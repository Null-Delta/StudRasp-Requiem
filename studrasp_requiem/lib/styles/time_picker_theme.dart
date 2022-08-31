import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

TimePickerThemeData appPickerTheme(AppColors colors, AppDefaultTextStyles textStyles) => TimePickerThemeData(
      backgroundColor: colors.backgroundPrimary,
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      dayPeriodColor: colors.accentPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      dayPeriodTextColor: colors.backgroundPrimary,
      dayPeriodShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      hourMinuteColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? colors.accentPrimary! : colors.backgroundSecondary!,
      ),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? colors.backgroundPrimary! : colors.accentPrimary!,
      ),
      dialHandColor: colors.accentPrimary,
      dialBackgroundColor: colors.backgroundSecondary,
      hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle: textStyles.subtitle,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      dialTextColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? colors.backgroundPrimary! : colors.accentPrimary!,
      ),
      entryModeIconColor: colors.accentPrimary,
    );
