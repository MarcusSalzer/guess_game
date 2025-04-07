import 'package:flutter/material.dart';
import 'package:guess_app/dataset.dart';
import 'package:guess_app/db_service.dart';

class TopicManager extends ChangeNotifier {
  final DBService _db;

  int get ntopics => GameTopic.values.length;
  List<GameTopic> get topics => GameTopic.values;

  // temporary, keep shuffled lists in memory
  final Map<GameTopic, List<int>> _queues = {};

  TopicManager(this._db) {
    // ignore: avoid_print
    print("INIT TopicManager");
  }

  shuffleTopic(GameTopic topic) {
    // get all idxs and shuffle inplace
    final queue = List.generate(topic.length, (i) => i);
    queue.shuffle();
    _db.saveTopicQueue(topic, queue);
    _queues[topic] = queue;
    notifyListeners();
  }

  List<int> getQueueMem(GameTopic topic) {
    final idxList = _queues[topic];
    if (idxList != null) {
      return idxList;
    } else {
      return List.generate(topic.length, (i) => i);
    }
  }

  /// get cached queue, or start loading from DB
  List<int>? getQueue(GameTopic topic) {
    final q = _queues[topic];
    if (q == null) {
      _loadQueue(topic).then((_) {
        notifyListeners();
      });
    }
    return q;
  }

  /// load from DB to cache
  Future<void> _loadQueue(GameTopic topic) async {
    _queues[topic] = await _db.loadTopicQueue(topic) ??
        List.generate(topic.length, (i) => i);
  }

  summary() {
    return "HEJ";
  }
}
