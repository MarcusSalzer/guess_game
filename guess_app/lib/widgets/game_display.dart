import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game_model.dart';

class GameDisplay extends StatefulWidget {
  const GameDisplay({super.key});

  @override
  State<GameDisplay> createState() => _GameDisplayState();
}

class _GameDisplayState extends State<GameDisplay> {
  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context, listen: false);
    return Column(
      children: [
        Expanded(
          child: Consumer<GameModel>(builder: (context, model, child) {
            if (model.isStarted) {
              // TODO: separate pre-game-screen??
              return Column(
                children: [
                  Text(model.secondsLeft.toString()),
                  Expanded(
                    child: Text(
                      model.current,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Text(model.score.toString()),
                ],
              );
            } else {
              return Center(child: Text("Get ready"));
            }
          }),
        ),
        // BUTTONS
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Selector<GameModel, bool>(
            selector: (context, model) => model.isStarted,
            builder: (context, isStarted, _) {
              if (isStarted) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: gameModel.skip, child: const Text("Skip")),
                    TextButton(
                        onPressed: gameModel.next, child: const Text("OK")),
                  ],
                );
              } else {
                return TextButton(
                    onPressed: gameModel.start, child: Text("Start"));
              }
            },
          ),
        )
      ],
    );
  }
}
