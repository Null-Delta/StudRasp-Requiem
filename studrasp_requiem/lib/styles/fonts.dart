import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppDefaultTextStyles extends AppTextStyles {
  AppDefaultTextStyles(AppColors colors)
      : super(
          largeTitle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 32,
              color: colors.accentPrimary,
            ),
          ),
          title: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: colors.accentPrimary,
            ),
          ),
          subtitle: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: colors.accentPrimary,
            ),
          ),
          label: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: colors.accentPrimary,
            ),
          ),
          smallLabel: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: colors.accentPrimary,
            ),
          ),
        );
}

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  AppTextStyles({
    required this.largeTitle,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.smallLabel,
  });

  TextStyle? largeTitle;
  TextStyle? title;
  TextStyle? subtitle;
  TextStyle? label;
  TextStyle? smallLabel;

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? largeTitle,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? label,
    TextStyle? smallLabel,
  }) {
    return AppTextStyles(
      largeTitle: largeTitle ?? this.largeTitle,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      label: label ?? this.label,
      smallLabel: smallLabel ?? this.smallLabel,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    return this;
  }
}
