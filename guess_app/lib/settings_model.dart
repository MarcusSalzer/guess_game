// Keep current settings in memory, for convenient access

import 'package:flutter/material.dart';
import 'package:guess_app/db_service.dart';

class SettingsModel extends ChangeNotifier {
  bool _darkMode = true;
  final DBService _service;

  SettingsModel(this._service) {
    _service.loadPrefs(this);
  }

  setDarkMode(bool value) {
    _darkMode = value;
    _service.updatePrefs(this);

    notifyListeners();
  }

  isDarkMode() {
    return _darkMode;
  }
}
