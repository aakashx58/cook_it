import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const _lightColor = Color.fromARGB(255, 240, 240, 240);
  static const _darkColor = Color.fromARGB(255, 25, 25, 25);

  static ThemeData appTheme({bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.ubuntuTextTheme().apply(
        bodyColor: isDark ? _lightColor : _darkColor,
        displayColor: isDark ? _lightColor : _darkColor,
      ),
      colorScheme: isDark ? _darkColorScheme() : _lightColorScheme(),
      // colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.teal,
      //     brightness: isDark ? Brightness.dark : Brightness.light),
    );
  }

  static ColorScheme _lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.teal,
      onPrimary: _darkColor,
      secondary: Colors.indigo,
      onSecondary: _lightColor,
      error: Colors.red,
      onError: _lightColor,
      background: _lightColor,
      onBackground: _darkColor,
      surface: _lightColor,
      onSurface: _darkColor,
    );
  }

  static ColorScheme _darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.teal,
      onPrimary: _darkColor,
      secondary: Colors.indigo,
      onSecondary: _lightColor,
      error: Colors.red,
      onError: _lightColor,
      background: _darkColor,
      onBackground: _lightColor,
      surface: _darkColor,
      onSurface: _lightColor,
    );
  }
}
