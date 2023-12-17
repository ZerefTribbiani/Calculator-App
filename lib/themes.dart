import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFFFFFFF),
    background: const Color(0xFFF7F8FB),
    onBackground: const Color(0xFF424242),
    primaryContainer: const Color(0xFFFFFFFF),
    onPrimaryContainer: const Color(0xFF38B9FF),
    secondaryContainer: const Color(0xFFADE2FF),
    onSecondaryContainer: const Color(0xFF109DFF),
    secondary: const Color(0xFF19ACFF), // altSecondaryContainer
    onSecondary: const Color(0xFFB2DAFF), // onAltSecondaryContainer
    tertiaryContainer: const Color(0xFFFFFFFF),
    onTertiaryContainer: const Color(0xFF858585),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF303136),
    background: const Color(0xFF17181A),
    onBackground: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFF303136),
    onPrimaryContainer: const Color(0xFF29A8FF),
    secondaryContainer: const Color(0xFF005DB2),
    onSecondaryContainer: const Color(0xFF339DFF),
    secondary: const Color(0xFF1991FF), // altSecondaryContainer
    onSecondary: const Color(0xFFB2DAFF), // onAltSecondaryContainer
    tertiaryContainer: const Color(0xFF616161),
    onTertiaryContainer: const Color(0xFFA5A5A5),
  ),
);
