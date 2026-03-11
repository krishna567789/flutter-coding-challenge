import 'package:flutter/material.dart';

class AppColors {

  static const primary = Color(0xff2962FF);
  static const secondary = Color(0xff00C853);

  static const background = Color(0xffF5F5F5);

  static const textPrimary = Color(0xff212121);
  static const textSecondary = Color(0xff757575);

  static const white = Colors.white;
  static const error = Colors.red;

  /// DARK COLORS
  static const darkBackground = Color(0xff121212);
  static const darkTextPrimary = Colors.white;
  static const darkTextSecondary = Color(0xffB0B0B0);
}

class AppTheme {

  /// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.background,

    primaryColor: AppColors.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
  );

  /// DARK THEME
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.darkBackground,

    primaryColor: AppColors.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
  );
}