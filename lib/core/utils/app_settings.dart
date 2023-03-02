import 'package:flutter/material.dart';

class AppSettings {
  static Color get primaryColor => Colors.deepPurple;
  static Color get greyColor => const Color.fromRGBO(244, 242, 245, 1.0);
  static double get defaultPadding => 20;
  static double get defaultIconSize => 24;
  static double get inputBorder => 5;
}

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}
