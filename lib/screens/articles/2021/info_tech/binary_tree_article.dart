import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:markup_text/markup_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/models.dart';
import '../../../../widgets/widgets.dart';

class BinaryTreeArticle extends StatefulWidget {
  const BinaryTreeArticle({Key? key}) : super(key: key);

  @override
  State<BinaryTreeArticle> createState() => _BinaryTreeArticleState();
}

class _BinaryTreeArticleState extends State<BinaryTreeArticle> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('From binary tree to exponential search'),
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
          body: FutureBuilder<String>(
            future: getArticle(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: screenWidth < 700
                        ? smallScreenLayout(snapshot.data)
                        : screenWidth < 1200
                            ? mediumScreenLayout(snapshot.data)
                            : largeScreenLayout(snapshot.data),
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: screenWidth < 700
                        ? smallScreenLayout('Error loading article')
                        : screenWidth < 1200
                            ? mediumScreenLayout('Error loading article')
                            : largeScreenLayout('Error loading article'),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        );
      },
    );
  }

  Widget smallScreenLayout(String? article) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          MarkupText(
            article!,
            style: const TextStyle(),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout(String? article) {
    debugPrint('Binary tree article: $article');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          Markdown(
            data: article ?? '',
            shrinkWrap: true,
          ),
          // MarkupText(
          //   article!,
          //   style: const TextStyle(),
          //   textAlign: TextAlign.justify,
          // ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }

  Widget largeScreenLayout(String? article) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          MarkupText(
            article!,
            style: const TextStyle(),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }

  Future<String> getArticle() async {
    final String article = await rootBundle
        .loadString('assets/articles/2021/binary_tree_article.md');
    return article;
  }
}
