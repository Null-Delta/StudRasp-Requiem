import 'package:flutter/material.dart';

import 'colors.dart';

ButtonStyle plainButton(AppColors colors) => ElevatedButton.styleFrom(
      primary: Colors.transparent,
      onPrimary: colors.accentPrimary,
      shadowColor: Colors.transparent,
      onSurface: colors.backgroundPrimary,
      surfaceTintColor: colors.backgroundPrimary,
      elevation: 0,
      maximumSize: const Size(36, 36),
      minimumSize: const Size(36, 36),
      fixedSize: const Size(36, 36),
      padding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
    );
