import 'package:flutter/material.dart';

class HoubagoTheme {
  static const Color primary = Color(0xFFDFA160);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);

  static TextStyle get displayLarge => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: darkerText,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: darkerText,
      );

  static TextStyle get displaySmall => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: darkerText,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: darkerText,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: darkerText,
      );

  static TextStyle get titleSmall => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: darkerText,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: darkText,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: darkText,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: lightText,
      );
}
