import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/resources.dart';

abstract interface class AppTheme {
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
      textTheme: _textTheme(colorScheme),
      filledButtonTheme: _filledButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        maximumSize: LayoutConstants.buttonSize,
        padding: const EdgeInsetsDirectional.all(Spacing.medium),
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        maximumSize: LayoutConstants.buttonSize,
        shape: const RoundedRectangleBorder(borderRadius: ShapeBorderRadius.medium),
        padding: const EdgeInsetsDirectional.all(Spacing.normal),
      ),
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700, height: 1.5),
      displayMedium: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.5),
      displaySmall: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, height: 1.5),
      headlineLarge: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700, height: 1.5),
      headlineMedium: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1.5),
      headlineSmall: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1.5),
      titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurfaceVariant),
      bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.5),
      bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
      bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),
      labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    return const InputDecorationTheme(
      errorStyle: TextStyle(fontWeight: FontWeight.w500),
      contentPadding: EdgeInsets.all(Spacing.normal),
      alignLabelWithHint: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.all(RadiusValues.small)),
    );
  }
}
