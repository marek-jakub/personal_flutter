import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../router/route_generator.dart';

import 'personalme_theme.dart';

void main() {
  runApp(const JakubPersonal());
}

class JakubPersonal extends StatefulWidget {
  const JakubPersonal({super.key});

  @override
  State<JakubPersonal> createState() => _JakubPersonalState();
}

class _JakubPersonalState extends State<JakubPersonal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marek Jakub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Marek Jakub'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _stateManager = StateManager();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _stateManager),
      ],
      child: Consumer<StateManager>(
        builder: (context, stateManager, child) {
          ThemeData theme;
          if (stateManager.darkMode) {
            theme = MonitoRingTheme.dark();
          } else {
            theme = MonitoRingTheme.light();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
