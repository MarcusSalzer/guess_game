import 'package:flutter/material.dart';
import 'package:guess_app/dataset.dart';
import 'package:guess_app/screens/data_check_screen.dart';
import 'package:guess_app/screens/game_screen.dart';
import 'package:guess_app/screens/settings_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              label: Text("settings"),
              icon: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: TopicList(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataCheckScreen(),
                      ),
                    );
                  },
                  label: Text("data check"),
                  icon: Icon(Icons.data_array),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopicList extends StatelessWidget {
  const TopicList({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = GameTopic.values;

    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return Center(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(topics[index].displayName),
            ),
            onTap: () {
              // Start a fresh game
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameScreen(topics[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
