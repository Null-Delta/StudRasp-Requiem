import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

extension ThemePicker on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}
