import 'dart:io';

import 'package:guess_app/settings_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// important: this file will contain Isar's generated code.
part 'db_service.g.dart';

/// A singleton Isar object holding app prefs
@collection
class Preferences {
  Id id = 0; // a single instance.
  bool darkMode = false;
}

/// Hold queue state for each topic
@collection
class TopicState {
  Id id = Isar.autoIncrement;
  String topicName;
  List<int> queue = [];
  TopicState(this.topicName);
}

class DBService {
  final Isar _isar;

  DBService(this._isar);

  /// Save app preferences
  Future<void> updatePrefs(SettingsModel model) async {
    await _isar.writeTxn(() async {
      _isar.preferences.put(Preferences()..darkMode = model.isDarkMode());
    });
  }

  /// Load app preferences
  Future<void> loadPrefs(SettingsModel model) async {
    final prefs = await _isar.preferences.get(0);

    if (prefs != null) {
      model.setDarkMode(prefs.darkMode);
    }
  }

  /// Save topic state
  // TODO!
}

/// Initialize DB connection
Future<Isar> initIsar() async {
  final docDir = await getApplicationDocumentsDirectory();
  final path = p.join(docDir.path, 'guess_app');
  // Ensure storage folder exists
  Directory(path).createSync();
  final isar = await Isar.open([PreferencesSchema], directory: path);
  return isar;
}
