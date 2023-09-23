import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(builder: (context, stateManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Marek Jakub: Photos'),
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
        body: screenWidth < 700
            ? smallScreenLayout()
            : screenWidth < 1200
                ? mediumScreenLayout()
                : largeScreenLayout(),
      );
    });
  }

  Widget smallScreenLayout() {
    return Padding(
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
                      Navigator.pushNamed(context, '/articles');
                    },
                    child: const Text('Articles'),
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
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    return const Text('medium screen layout');
  }

  Widget largeScreenLayout() {
    return const Text('large screen layout');
  }
}
