import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personalme/models/models.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Marek Jakub'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Switch(
                    value: stateManager.darkMode,
                    onChanged: (value) {
                      stateManager.setDarkMode = value;
                    }),
              )
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Welcome_screen'),
              ],
            ),
          ),
        );
      },
    );
  }

  void setMode() {}
}
