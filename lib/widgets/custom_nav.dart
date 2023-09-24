import 'package:flutter/material.dart';

/// Website navigation buttons.
class CustomNavButtons extends StatelessWidget {
  const CustomNavButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 700
        ? smallScreenLayout(context)
        : mediumAndLargeScreenLayout(context);
  }
}

Widget smallScreenLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
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
  );
}

Widget mediumAndLargeScreenLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
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
  );
}
