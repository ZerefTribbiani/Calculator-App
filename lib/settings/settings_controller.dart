import 'package:flutter/material.dart';

import 'settings_persistence.dart';

class SettingsController {
  final SettingsPersistenceManager _persistenceManager;

  final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier<ThemeMode>(ThemeMode.system);
  final ValueNotifier<int> precisionNotifier = ValueNotifier<int>(2);
  final ValueNotifier<int> displayTextSizeNotifier = ValueNotifier<int>(8);

  SettingsController() : _persistenceManager = SettingsPersistenceManager() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    themeModeNotifier.value = await _persistenceManager.getThemeMode();
    precisionNotifier.value = await _persistenceManager.getPrecision();
    displayTextSizeNotifier.value =
        await _persistenceManager.getDisplayTextSize();
  }

  void setThemeMode(ThemeMode themeMode) {
    themeModeNotifier.value = themeMode;
    _persistenceManager.setThemeMode(themeMode);
  }

  void setPrecision(int precision) {
    precisionNotifier.value = precision;
    _persistenceManager.setPrecision(precision);
  }

  void setDisplayTextSize(int displayTextSize) {
    displayTextSizeNotifier.value = displayTextSize;
    _persistenceManager.setDisplayTextSize(displayTextSize);
  }
}
