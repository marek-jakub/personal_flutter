import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:markup_text/markup_text.dart';

import '../models/models.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateManager>(builder: (context, stateManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Marek Jakub: About'),
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
                  ],
                ),
              ),
              const Expanded(
                child: Image(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/MJ_small.jpg'),
                ),
              ),
              const SizedBox(
                width: 450,
                height: 200,
                child: MarkupText(
                  "Marek Jakub is a student of Computing and Information Technologies (IT) at"
                  " The Open University (The OU), Milton Keynes, UK. He holds a BSc (Hons) in"
                  " Natural Sciences from the same university. When he is not engaged in study,"
                  " he might be found occupied with his other interests: biology or sport."
                  " He lives in Slovakia.",
                  style: TextStyle(),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
