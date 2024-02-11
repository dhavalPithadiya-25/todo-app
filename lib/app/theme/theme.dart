import 'package:flutter/material.dart';

abstract class AppTheme {
  static const _defaultFontFamily = "Poppins";

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  );
  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );

  static ThemeData get lightTheme => _getTheme(_lightColorScheme);

  static ThemeData get darkTheme => _getTheme(_darkColorScheme);

  static ThemeData _getTheme(ColorScheme colorScheme) {
    return ThemeData(
      brightness: colorScheme.brightness,
      fontFamily: _defaultFontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
    );
  }
}
