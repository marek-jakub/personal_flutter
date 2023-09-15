import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
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
          ],
        ),
      ),
    );
  }
}
