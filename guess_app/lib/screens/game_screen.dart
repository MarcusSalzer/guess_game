import 'package:flutter/material.dart';
import 'package:guess_app/dataset.dart';
import 'package:guess_app/game_model.dart';
import 'package:guess_app/widgets/result_display.dart';
import 'package:guess_app/widgets/game_display.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  final GameTopic topic;

  const GameScreen(this.topic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(topic.displayName)),
      body: ChangeNotifierProvider(
        create: (_) => GameModel(topic),
        child: Selector<GameModel, bool>(
          selector: (context, model) => model.isComplete,
          builder: (context, isComplete, child) {
            return isComplete ? const ResultDisplay() : const GameDisplay();
          },
        ),
      ),
    );
  }
}
