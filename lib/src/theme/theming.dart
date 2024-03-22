import 'package:checkup/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(
    background: AppColors.white,
    onBackground: AppColors.grey,
    primary: AppColors.primary,
    onError: AppColors.white,
    outline: AppColors.tertiary,
  ),
  textTheme: GoogleFonts.montserratTextTheme().apply(
    bodyColor: AppColors.white,
    displayColor: AppColors.grey,
  ),
);
