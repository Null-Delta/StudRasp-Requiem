import 'package:flutter/material.dart';

class AppDarkColors extends AppColors {
  const AppDarkColors()
      : super(
          separator: const Color(0xFF3C3F51),
          accentPrimary: const Color(0xFFF6F7FF),
          accentSecondary: const Color(0xFFECEFFC),
          disable: const Color(0xFF8388A2),
          backgroundPrimary: const Color(0xFF252837),
          backgroundSecondary: const Color(0xFF2E3144),
          destructive: const Color(0xFFE72828),
          shadow: const Color(0x44000000),
        );
}

class AppLightColors extends AppColors {
  const AppLightColors()
      : super(
          separator: const Color(0xFFDEE2F5),
          accentPrimary: const Color(0xFF252837),
          accentSecondary: const Color(0xFF373B4F),
          disable: const Color(0xFF8388A2),
          backgroundPrimary: const Color(0xFFF6F7FF),
          backgroundSecondary: const Color(0xFFECEFFC),
          destructive: const Color(0xFFC13E3E),
          shadow: const Color(0x198388A2),
        );
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.separator,
    required this.accentPrimary,
    required this.accentSecondary,
    required this.disable,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.destructive,
    required this.shadow,
  });

  final Color? separator;
  final Color? accentPrimary;
  final Color? accentSecondary;
  final Color? disable;
  final Color? backgroundPrimary;
  final Color? backgroundSecondary;
  final Color? destructive;
  final Color? shadow;

  @override
  AppColors copyWith({
    Color? separator,
    Color? accentPrimary,
    Color? accentSecondary,
    Color? disable,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? destructive,
    Color? shadow,
  }) {
    return AppColors(
      separator: separator ?? this.separator,
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      disable: disable ?? this.disable,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      destructive: destructive ?? this.destructive,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      separator: Color.lerp(separator, other.separator, t),
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t),
      accentSecondary: Color.lerp(accentSecondary, other.accentSecondary, t),
      disable: Color.lerp(disable, other.disable, t),
      backgroundPrimary: Color.lerp(backgroundPrimary, other.backgroundPrimary, t),
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t),
      destructive: Color.lerp(destructive, other.destructive, t),
      shadow: Color.lerp(shadow, other.shadow, t),
    );
  }
}
