import 'package:flutter/material.dart';
import 'package:home_camper_gallery/theme/home_camper_colors.dart';

ThemeData homeCamperTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: HomeCamperColors.primary),
  buttonTheme: const ButtonThemeData(
    height: 56,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
    filled: true,
    fillColor: const Color(0XFFF2F2F5),
    isDense: true,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  useMaterial3: true,
);
