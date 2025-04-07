import 'package:flutter/material.dart';
import 'package:guess_app/dataset.dart';
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
              builder: (context, topicManager, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(topicManager.summary()),
                    Divider(),
                    Text(
                      "all topics",
                      style: TextStyle(fontSize: 20),
                    ),
                    Column(
                      children: topicManager.topics
                          .map((t) => TopicInfoTile(t))
                          .toList(),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TopicInfoTile extends StatelessWidget {
  final GameTopic _topic;
  const TopicInfoTile(this._topic, {super.key});

  @override
  Widget build(BuildContext context) {
    final topicM = Provider.of<TopicManager>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(_topic.name),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(_topic.length.toString()),
              ),
              TextButton.icon(
                onPressed: () {
                  topicM.shuffleTopic(_topic);
                },
                label: Text("Shuffle"),
                icon: Icon(Icons.shuffle),
              ),
            ],
          ),
          // show the full list

          Consumer<TopicManager>(
            builder: (context, tmProvider, child) {
              final q = tmProvider.getQueue(_topic);

              if (q == null) {
                return Text("loading...");
              }

              return Wrap(
                children: q
                    .map(
                      (idx) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Chip(
                          label: Text(_topic.items[idx]),
                          padding: EdgeInsets.all(1),
                          labelStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
