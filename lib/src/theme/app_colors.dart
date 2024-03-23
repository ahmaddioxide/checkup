import 'package:flutter/material.dart';

//App Colors

class AppColors {
  static const Color primary = Color(0xFFDF034D); //redish
  static const Color secondary = Color(0xFFFFDCE8); //pinkish
  static const Color tertiary = Color(0xFF69936A); //greenish
  static const Color quaternary = Color(0xFF86022E); //dark redish
  static const Color grey = Color(0xFF0D0D0D); //blackish
  static const Color white = Color(0xFFFFFFFF); //white
  static const Color background = Color(0xFF85022f); //black
}

//Primary Color Swatch
MaterialColor primarySwatch =
    MaterialColor(AppColors.primary.value, <int, Color>{
  50: AppColors.primary.withOpacity(0.1),
  100: AppColors.primary.withOpacity(0.2),
  200: AppColors.primary.withOpacity(0.3),
  300: AppColors.primary.withOpacity(0.4),
  400: AppColors.primary.withOpacity(0.5),
  500: AppColors.primary.withOpacity(0.6),
  600: AppColors.primary.withOpacity(0.7),
  700: AppColors.primary.withOpacity(0.8),
  800: AppColors.primary.withOpacity(0.9),
  900: AppColors.primary.withOpacity(1),
});

