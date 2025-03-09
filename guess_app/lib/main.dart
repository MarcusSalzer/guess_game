import 'package:flutter/material.dart';
import 'package:guess_app/screens/main_menu.dart';
import 'package:guess_app/settings_model.dart';
import 'package:guess_app/db_service.dart';
import 'package:guess_app/topic_manager.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(service: DBService(await initIsar())));
}

class MyApp extends StatelessWidget {
  final DBService service;

  const MyApp({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel(service)),
        ChangeNotifierProvider(create: (context) => TopicManager(service)),
      ],
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
