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



// class SettingsService {
//   late final Isar _isar;

//   SettingsService() {
//     _init();
//   }
//   _init() async {
//     final dir = await getApplicationDocumentsDirectory();
//     _isar = await Isar.open([PreferencesSchema], directory: dir.path);

//     print("init settingsservice");
//   }
// }

/// Handle settings and database.
// class SettingsService {
//   late final Preferences _preferences;
//   late final Isar _isar;

//   /// private constructor.
//   /// initializes Isar and loads preferences synchronously.
//   SettingsService._() {
//     final dir = await getApplicationDocumentsDirectory();
//     _isar = Isar.openSync([PreferenceSchema], directory: dir.path);
//     _preferences = _isar.preferences.getSync(0) ?? Preferences();
//   }

//   static final SettingsService _instance =
//       SettingsService._internal(Isar.getInstance()!);

//   factory SettingsService() => _instance;

//   // Get current preferences
//   Preferences get preferences {
//     if (_preferences == null) {
//       throw Exception("Preferences not loaded. Call loadPreferences first.");
//     }
//     return _preferences!;
//   }

  // Update preferences (async write)
  // Future<void> updatePreferences(void Function(Preferences) updates) async {
  //   if (_preferences == null) {
  //     throw Exception("Preferences not loaded. Call loadPreferences first.");
  //   }
  //   updates(_preferences!);
  //   await _isar.writeTxn(() async {
  //     await _isar.preferences.put(_preferences!);
  //   });
  // }
// }
