import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTypography.textTheme,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: AppTypography.textTheme,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}
