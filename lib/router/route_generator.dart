import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../screens/articles/articles.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case '/articles':
        return MaterialPageRoute(builder: (_) => const ArticlesScreen());
      case '/photos':
        return MaterialPageRoute(builder: (_) => const PhotosScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/binarytree':
        return MaterialPageRoute(builder: (_) => const BinaryTreeArticle());
      case '/bookcase':
        return MaterialPageRoute(builder: (_) => const BookcaseArticle());
      case '/hunt':
        return MaterialPageRoute(builder: (_) => const OoneSearchArticle());
      case '/solvenot':
        return MaterialPageRoute(builder: (_) => const HrankProblemArticle());
      case '/traversal':
        return MaterialPageRoute(builder: (_) => const TraversalArticle());
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
