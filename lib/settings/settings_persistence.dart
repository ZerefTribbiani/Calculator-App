import 'package:flutter/material.dart' show ThemeMode;

import 'package:shared_preferences/shared_preferences.dart';

class SettingsPersistenceManager {
  final Future<SharedPreferences> prefsFuture = SharedPreferences.getInstance();

  Future<ThemeMode> getThemeMode() async {
    final prefs = await prefsFuture;
    final theme = prefs.getString('themeMode') ?? 'system';
    return ThemeMode.values.byName(theme);
  }

  Future<int> getPrecision() async {
    final prefs = await prefsFuture;
    return prefs.getInt('precision') ?? 2;
  }

  Future<int> getDisplayTextSize() async {
    final prefs = await prefsFuture;
    return prefs.getInt('displayTextSize') ?? 8;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await prefsFuture;
    await prefs.setString('themeMode', themeMode.name);
  }

  Future<void> setPrecision(int precision) async {
    final prefs = await prefsFuture;
    await prefs.setInt('precision', precision);
  }

  Future<void> setDisplayTextSize(int displayTextSize) async {
    final prefs = await prefsFuture;
    await prefs.setInt('displayTextSize', displayTextSize);
  }
}
