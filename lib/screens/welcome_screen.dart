import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;

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
          body: screenWidth < 700
              ? smallScreenLayout()
              : screenWidth < 1200
                  ? mediumScreenLayout()
                  : largeScreenLayout(),
        );
      },
    );
  }

  Widget smallScreenLayout() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CustomNavButtons(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    return const Column(
      children: [
        CustomNavButtons(),
        Text('medium screen layout'),
      ],
    );
  }

  Widget largeScreenLayout() {
    return const Column(
      children: [
        CustomNavButtons(),
        Text('large screen layout'),
      ],
    );
  }
}
