import 'package:flutter/material.dart';

import '../screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case '/articles':
        return MaterialPageRoute(builder: (_) => const ArticlesScreen());
      case '/photos':
        return MaterialPageRoute(builder: (_) => const PhotosScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Sorry no route was found!',
              style: TextStyle(color: Colors.red, fontSize: 18.0)),
        ),
      );
    });
  }
}
