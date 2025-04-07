import 'package:flutter/material.dart';
import 'package:guess_app/screens/main_menu.dart';
import 'package:guess_app/settings_model.dart';
import 'package:guess_app/db_service.dart';
import 'package:guess_app/topic_manager.dart';

import 'package:provider/provider.dart';

void main() async {
  // note: we need the DB to be ready to read user prefs when starting app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(dbService: DBService(await initIsar())));
}

class MyApp extends StatelessWidget {
  final DBService dbService;

  const MyApp({super.key, required this.dbService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Settings and Topics are globally accesible
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel(dbService)),
        ChangeNotifierProvider(create: (context) => TopicManager(dbService)),
      ],
      child: Consumer<SettingsModel>(
        builder: (context, settings, child) => MaterialApp(
          title: '...',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green, brightness: Brightness.dark),
            brightness: Brightness.dark,
            useMaterial3: true,
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
