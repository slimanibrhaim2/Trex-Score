import 'package:flutter/material.dart';

// --- LIGHT THEME ---
final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    accentColor: Colors.blueGrey,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    elevation: 1,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.white,
  ),
);

// --- DARK THEME ---
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    accentColor: Colors.blueGrey,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: Colors.white54,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black26,
    foregroundColor: Colors.white,
    elevation: 1,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white70,
    foregroundColor: Colors.black,
  ),
);
