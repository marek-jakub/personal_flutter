import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Marek Jakub: Articles'),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/welcome');
                          },
                          child: const Text('Home'),
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
                ),
                const CustomDateText(date: '2023'),
                const CustomDateText(date: '2022'),
                const CustomDateText(date: '2021'),
              ],
            ),
          ),
        );
      },
    );
  }
}
