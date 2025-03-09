// Keep current settings in memory, for convenient access

import 'package:flutter/material.dart';
import 'package:guess_app/settings_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class SettingsModel extends ChangeNotifier {
  bool _darkMode = true;
  SettingsService? _service;

  SettingsModel() {
    initIsar().then((value) {
      _service = SettingsService(value);
      _service?.loadPrefs(this);
    });
  }

  setDarkMode(bool value) {
    _darkMode = value;
    _service!.updatePrefs(this);

    notifyListeners();
  }

  isDarkMode() {
    return _darkMode;
  }

  /// Initialize DB connection
  Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([PreferencesSchema],
        directory: p.join(dir.path, 'guess_app'));
    return isar;
  }
}
