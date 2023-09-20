import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/models.dart';
import '../router/route_generator.dart';

import 'personalme_theme.dart';

void main() {
  runApp(const MarkPersonal());
}

class MarkPersonal extends StatefulWidget {
  const MarkPersonal({super.key});

  @override
  State<MarkPersonal> createState() => _MarkPersonalState();
}

class _MarkPersonalState extends State<MarkPersonal> {
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

          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          });
        },
      ),
    );
  }
}
