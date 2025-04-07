import 'dart:io';

import 'package:guess_app/dataset.dart';
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
  Id id; // only valid topic indices
  List<int> queue = [];
  // TODO, how to save remember and load these...
  int pos = 0; // where are we

  TopicState(this.id, this.queue);
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
  Future<void> saveTopicQueue(GameTopic topic, List<int> queue) async {
    final tState = TopicState(topic.index, queue);
    await _isar.writeTxn(() async {
      await _isar.topicStates.put(tState);
    });
    print("saved topic state");
  }

  /// Load queue for a topic, return null if not found
  Future<List<int>?> loadTopicQueue(GameTopic topic) async {
    final tState = await _isar.txn(() async {
      return await _isar.topicStates.get(topic.index);
    });
    if (tState != null) {
      print("found & loaded topic state");
    } else {
      print("topic state NOT found");
    }
    return tState?.queue;
  }
}

/// Initialize DB connection
Future<Isar> initIsar() async {
  final docDir = await getApplicationDocumentsDirectory();
  final path = p.join(docDir.path, 'guess_app');
  // Ensure storage folder exists
  Directory(path).createSync();
  final isar =
      await Isar.open([PreferencesSchema, TopicStateSchema], directory: path);
  return isar;
}
