import 'package:flutter/material.dart';
import 'package:guess_app/screens/settings_screen.dart';
import 'package:guess_app/settings_model.dart';
import 'package:guess_app/topic_manager.dart';
import 'package:provider/provider.dart';

/// For viewing database content
class DataCheckScreen extends StatelessWidget {
  const DataCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Check'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Preferences",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Consumer<SettingsModel>(builder: (context, settings, child) {
              return Column(
                children: [
                  Text("Dark mode: ${settings.isDarkMode()}"),
                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Topics",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Consumer<TopicManager>(
              builder: (context, topics, child) {
                return Text(topics.summary());
              },
            ),
          ],
        ),
      ),
    );
  }
}
