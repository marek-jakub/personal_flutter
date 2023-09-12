import 'package:flutter/material.dart';

import '../screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case '/articles':
      //   return MaterialPageRoute(builder: (_) => const Articles());
      // case '/edit_employee':
      //   if (args is int) {
      //     return MaterialPageRoute(
      //         builder: (_) => EditEmployeeScreen(id: args));
      //   }
      //   return _errorRoute();
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutScreen());
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
