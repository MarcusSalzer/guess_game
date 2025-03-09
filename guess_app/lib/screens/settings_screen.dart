import 'package:flutter/material.dart';
import 'package:guess_app/settings_model.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: SettingsMenu(),
      ),
    );
  }
}

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({
    super.key,
  });

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    SettingsModel settings = Provider.of<SettingsModel>(context, listen: false);
    return Column(
      children: [
        Text("settings"),
        Row(
          children: [
            Text("Dark mode"),
            Switch(
              value: settings.isDarkMode(),
              onChanged: (bool value) {
                setState(() {
                  settings.setDarkMode(value);
                });
                print(settings.isDarkMode());
              },
            ),
          ],
        )
      ],
    );
  }
}
