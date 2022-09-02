import 'package:flutter/material.dart';

import 'colors.dart';

ButtonStyle plainButton(AppColors colors, {Size size = const Size(36, 36)}) => ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: colors.accentPrimary,
      shadowColor: Colors.transparent,
      onSurface: colors.backgroundPrimary,
      surfaceTintColor: colors.backgroundPrimary,
      elevation: 0,
      maximumSize: size,
      minimumSize: size,
      fixedSize: size,
      padding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );

ButtonStyle tabButton(AppColors colors, bool isSelected, {Size size = const Size(36, 36)}) => ElevatedButton.styleFrom(
      primary: isSelected ? colors.accentPrimary : colors.backgroundPrimary,
      shadowColor: Colors.transparent,
      onSurface: colors.backgroundPrimary,
      surfaceTintColor: colors.backgroundPrimary,
      elevation: 0,
      maximumSize: size,
      minimumSize: size,
      fixedSize: size,
      padding: const EdgeInsets.all(0),
      side: BorderSide(width: 1, color: isSelected ? Colors.transparent : colors.separator!),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    );
