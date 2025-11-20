import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(primaryColor: AppColors.primary);
}
