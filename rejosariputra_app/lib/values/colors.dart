import 'package:flutter/material.dart';

class ColorPalette {
  static const int _primaryColor = 0xFF0072C6;
  static const MaterialColor primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFF0F8FF),
      100: Color(0xFFE0EFFE),
      200: Color(0xFFB9E0FE),
      300: Color(0xFF7CC8FD),
      400: Color(0xFF36AEFA),
      500: Color(0xFF0C93EB),
      600: Color(_primaryColor),
      700: Color(0xFF015BA3),
      800: Color(0xFF064E86),
      900: Color(0xFF0B426F),
    },
  );

  static const int _errorColor = 0xFFDC2626;
  static const MaterialColor error = MaterialColor(
    _errorColor,
    <int, Color>{
      50: Color(0xFFFEF2F2),
      100: Color(0xFFFEE2E2),
      200: Color(0xFFFECACA),
      300: Color(0xFFFCA5A5),
      400: Color(0xFFF87171),
      500: Color(0xFFEF4444),
      600: Color(_errorColor),
      700: Color(0xFFB91C1C),
      800: Color(0xFF991B1B),
      900: Color(0xFF7F1D1D),
    },
  );

  static const int _successColor = 0xFF16A34A;
  static const MaterialColor success = MaterialColor(
    _successColor,
    <int, Color>{
      50: Color(0xFFF0FDF5),
      100: Color(0xFFDCFCE8),
      200: Color(0xFFBBF7D1),
      300: Color(0xFF86EFAD),
      400: Color(0xFF4ADE81),
      500: Color(0xFF22C55E),
      600: Color(_successColor),
      700: Color(0xFF15803C),
      800: Color(0xFF166533),
      900: Color(0xFF14532B),
    },
  );

  static const int _warningColor = 0xFFEAB308;
  static const MaterialColor warning = MaterialColor(
    _warningColor,
    <int, Color>{
      50: Color(0xFFFEF9E8),
      100: Color(0xFFFEF0C3),
      200: Color(0xFFFEE28A),
      300: Color(0xFFFDD147),
      400: Color(0xFFFAC215),
      500: Color(_warningColor),
      600: Color(0xFFCA9A04),
      700: Color(0xFFA17C07),
      800: Color(0xFF85680E),
      900: Color(0xFF715A12),
    },
  );

  static const int _neutralColor = 0xFF171717;
  static const MaterialColor neutral = MaterialColor(
    _neutralColor,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFE5E5E5),
      300: Color(0xFFD4D4D4),
      400: Color(0xFFA3A3A3),
      500: Color(0xFF737373),
      600: Color(0xFF525252),
      700: Color(0xFF404040),
      800: Color(0xFF262626),
      900: Color(_neutralColor),
    },
  );
}
