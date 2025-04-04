import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: "GeneralSans",
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary900,
      onPrimary: AppColors.primary900,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.primary900,
    ),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
    ),
  );
}
