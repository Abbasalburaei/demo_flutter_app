import 'package:flutter/material.dart';
import 'app_settings.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: AppSettings.primaryColor,
        side: BorderSide(
            color: AppSettings.primaryColor, style: BorderStyle.solid),
        minimumSize: const Size(double.infinity, 55),
      )),
      appBarTheme: AppBarTheme(backgroundColor: AppSettings.primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppSettings.primaryColor,
              minimumSize: const Size(double.infinity, 55))),
      textTheme: TextTheme(
          titleMedium: TextStyle(color: AppSettings.primaryColor),
          headlineLarge: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
      primaryColor: AppSettings.primaryColor,
      iconTheme: IconThemeData(
          size: AppSettings.defaultIconSize,
          color:
              MaterialColorGenerator.from(AppSettings.primaryColor).shade500));
}
