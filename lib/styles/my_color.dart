import 'package:flutter/material.dart';

class MyColor {
  static const Color black = Color(0xFF1E1F27);

  static const coralColor = 0xFFD98639;

  static const Color coral = Color(coralColor);

  static const Color white = Colors.white;

  static const MaterialColor materialCoral = MaterialColor(
    coralColor,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(coralColor),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}
