import 'package:flutter/material.dart';
import 'package:guess_app/game_model.dart';
import 'package:guess_app/screens/game_screen.dart';
import 'package:provider/provider.dart';

// TODO: Separate results screen?
// state can me accessed from provider anyway

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key});

  static const textCorrect = TextStyle(color: Colors.amber);
  static const textWrong = TextStyle(color: Colors.brown);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GameModel>(context, listen: false);
    final results = model.results;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Results", style: TextStyle(fontSize: 30)),
        Expanded(
          child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    results[index].$1,
                    // style word based on correct or not.
                    style: results[index].$2 ? textCorrect : textWrong,
                  ),
                );
              }),
        ),
        Text("${model.score} / ${results.length} correct"),
        // BUTTONS for moving on
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // replay same topic
                        builder: (context) => GameScreen(model.topic),
                      ),
                    );
                  },
                  child: const Text("Play again")),
              TextButton(
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     // back home
                    //     builder: (context) => const MainMenu(),
                    //   ),
                    // );
                    Navigator.pop(context);
                  },
                  child: const Text("Main menu")),
            ],
          ),
        ),
      ],
    );
  }
}
