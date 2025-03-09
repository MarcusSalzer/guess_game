import 'package:flutter/material.dart';
import 'package:guess_app/screens/main_menu.dart';
import 'package:guess_app/settings_model.dart';
import 'package:guess_app/settings_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsModel(),
      child: Consumer<SettingsModel>(
        builder: (context, settings, child) => MaterialApp(
          title: '...',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          themeMode: settings.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
          home: Scaffold(
            body: MainMenu(),
          ),
        ),
      ),
    );
  }
}
