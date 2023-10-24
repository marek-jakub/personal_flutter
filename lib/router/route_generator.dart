import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../screens/articles/articles.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomeScreen());
      case '/about':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AboutScreen());
      case '/articles':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ArticlesScreen());
      case '/welcome':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WelcomeScreen());
      case '/binarytree':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BinaryTreeArticle());
      case '/bookcase':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BookcaseArticle());
      case '/hunt':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OoneSearchArticle());
      case '/solvenot':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HrankProblemArticle());
      case '/traversal':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const TraversalArticle());
      case '/provider':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ProviderErrorArticle());
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
              style: TextStyle(color: Colors.red, fontSize: 17.0)),
        ),
      );
    });
  }
}
