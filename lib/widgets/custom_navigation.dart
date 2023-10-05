import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

/// Website navigation buttons.
class CustomNavigation extends StatelessWidget {
  const CustomNavigation({
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
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Text('Menu'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/welcome');
          },
        ),
        ListTile(
          title: const Text('Blog'),
          onTap: () {
            Navigator.pushNamed(context, '/articles');
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
        ListTile(
          title: const Icon(Icons.email),
          onTap: () {},
        ),
        ListTile(
          title: const Icon(Brandico.github_1),
          onTap: () {},
        ),
        ListTile(
          title: const Icon(Brandico.linkedin_1),
          onTap: () {},
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
        GestureDetector(
          child: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/welcome');
          },
        ),
        GestureDetector(
          child: Text('Blog'),
          onTap: () {
            Navigator.pushNamed(context, '/articles');
          },
        ),
        GestureDetector(
          child: Text('About'),
          onTap: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
      ],
    ),
  );
}
