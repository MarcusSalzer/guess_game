import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guess_app/dataset.dart';

const gameSeconds = 5;

/// Handles logic of currently running game
class GameModel extends ChangeNotifier {
  final GameTopic topic;

  late final List<String> _list;
  int _pos = 0;
  Timer? _timer;

  late int secondsLeft;
  late String current;
  bool isComplete = false;
  bool isStarted = false;
  int score = 0;

  List<(String, bool)> results = [];

  GameModel(this.topic) {
    _list = topic.items;
    if (_list.isEmpty) {
      throw ArgumentError('Requires non-empty list');
    }
    secondsLeft = gameSeconds;
    current = _list.first;
  }

  /// Start game
  void start() {
    // start countdown
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsLeft--;
      if (secondsLeft == 0) {
        timer.cancel();
        _onGameEnd();
      }
      notifyListeners();
    });
    isStarted = true;
    notifyListeners();
  }

  /// Move to next card (correct answer)
  void next() {
    results.add((current, true));
    score++;
    _step();
  }

  /// Skip to next card (miss answer)
  void skip() {
    results.add((current, false));
    _step();
  }

  /// Move 1 step (cycle around)
  void _step() {
    // wrap around for index safety
    _pos++;
    _pos = _pos % _list.length;

    current = _list[_pos];
    notifyListeners();
  }

  void _onGameEnd() {
    isComplete = true;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
