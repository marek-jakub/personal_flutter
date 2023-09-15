import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
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
  }
}
