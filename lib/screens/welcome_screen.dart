import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

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
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              const Icon(Icons.light_mode),
              Switch(
                value: stateManager.darkMode,
                onChanged: (value) {
                  stateManager.setDarkMode = value;
                },
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                  child: Icon(Icons.dark_mode)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/articles');
                        },
                        child: const Text('Articles'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/photos');
                        },
                        child: const Text('Photo of the Month'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        },
                        child: const Text('About'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
