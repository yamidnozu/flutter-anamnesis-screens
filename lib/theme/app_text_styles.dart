import 'package:flutter/material.dart';

class AppTextStyles {
  // Futura Light (14px, w400)
  static const TextStyle bodyLight14 = TextStyle(
    fontFamily: 'Futura', // Ajustar con la fuente real si se requiere
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.0,
    decoration: TextDecoration.none,
  );

  // Futura Medium (16px, w500)
  static const TextStyle bodyMedium16 = TextStyle(
    fontFamily: 'Futura',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.04,
    decoration: TextDecoration.none,
  );

  // Futura Book (16px, w400)
  static const TextStyle bodyDefault16 = TextStyle(
    fontFamily: 'Futura',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.0,
    decoration: TextDecoration.none,
  );

  // Botón principal (Futura Medium 16px)
  static const TextStyle buttonMainButtons = TextStyle(
    fontFamily: 'Futura',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.0,
    decoration: TextDecoration.none,
  );

  // Placeholder en inputs (Futura Light 14px, italic)
  static const TextStyle buttonPlaceholderText = TextStyle(
    fontFamily: 'Futura',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 1.5,
    letterSpacing: 0.0,
    decoration: TextDecoration.none,
  );
}
