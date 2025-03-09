import 'package:guess_app/settings_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// important: this file will contain Isar's generated code.
part 'settings_service.g.dart';

/// A singleton Isar object
@collection
class Preferences {
  Id id = 0; // a single instance.
  bool darkMode = false;
}

class SettingsService {
  final Isar _isar;

  SettingsService(this._isar) {
    print("init settingsservice");
  }

  Future<void> updatePrefs(SettingsModel model) async {
    await _isar.writeTxn(() async {
      _isar.preferences.put(Preferences()..darkMode = model.isDarkMode());
    });
  }

  Future<void> loadPrefs(SettingsModel model) async {
    final prefs = await _isar.preferences.get(0);

    if (prefs != null) {
      model.setDarkMode(prefs.darkMode);
    }
  }
}
