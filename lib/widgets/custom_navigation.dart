import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Website navigation buttons.
class CustomNavigation extends StatefulWidget {
  const CustomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 900
        ? smallScreenLayout(context)
        : screenWidth < 1400
            ? mediumScreenLayout(context)
            : largeScreenLayout(context);
  }
}

Widget smallScreenLayout(BuildContext context) {
  return MenuAnchor(
    menuChildren: [
      MenuItemButton(
        child: const Text('Home'),
        onPressed: () => Navigator.pushNamed(context, '/welcome'),
      ),
      MenuItemButton(
        child: const Text('Blog'),
        onPressed: () => Navigator.pushNamed(context, '/articles'),
      ),
      MenuItemButton(
        child: const Text('About'),
        onPressed: () => Navigator.pushNamed(context, '/about'),
      ),
      MenuItemButton(
        child: const Icon(Icons.email),
        onPressed: () {
          _launchMailUrl();
        },
      ),
      MenuItemButton(
        child: const Icon(Brandico.github_1),
        onPressed: () {
          _launchGitHubUrl();
        },
      ),
      MenuItemButton(
        child: const Icon(Brandico.linkedin_1),
        onPressed: () {
          _launchLinkedInUrl();
        },
      ),
    ],
    builder: (context, controller, child) {
      return TextButton(
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: const Icon(Icons.menu),
      );
    },
  );
}

Widget mediumScreenLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/welcome');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Text('Blog'),
            onTap: () {
              Navigator.pushNamed(context, '/articles');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Icon(Icons.email),
            onTap: () {
              _launchMailUrl();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Icon(Brandico.github_1),
            onTap: () {
              _launchGitHubUrl();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
            child: const Icon(Brandico.linkedin_1),
            onTap: () {
              _launchLinkedInUrl();
            },
          ),
        ),
      ],
    ),
  );
}

Widget largeScreenLayout(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/welcome');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Text('Blog'),
            onTap: () {
              Navigator.pushNamed(context, '/articles');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Icon(Icons.email),
            onTap: () {
              _launchMailUrl();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Icon(Brandico.github_1),
            onTap: () {
              _launchGitHubUrl();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: GestureDetector(
            child: const Icon(Brandico.linkedin_1),
            onTap: () {
              _launchLinkedInUrl();
            },
          ),
        ),
      ],
    ),
  );
}

_launchMailUrl() async {
  String url = 'mailto:mj3935538@gmail.com';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}

_launchGitHubUrl() async {
  String url = 'https://github.com/marek-jakub';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}

_launchLinkedInUrl() async {
  String url = 'https://linkedin.com/in/marek-jakub-he-him-his-2a7502227';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}
