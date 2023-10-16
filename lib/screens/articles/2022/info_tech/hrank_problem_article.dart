//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
//import 'package:sizer/sizer.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../models/models.dart';
import '../../../../widgets/widgets.dart';

class HrankProblemArticle extends StatefulWidget {
  const HrankProblemArticle({Key? key}) : super(key: key);

  @override
  State<HrankProblemArticle> createState() => _HrankProblemArticleState();
}

class _HrankProblemArticleState extends State<HrankProblemArticle> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar(),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder<String>(
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
          ),
        );
      },
    );
  }

  Widget smallScreenLayout(String? article) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                MarkdownBody(
                  data: article ?? '',
                  //shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: WrapAlignment.spaceEvenly,
                  ),
                  imageBuilder: (uri, title, alt) {
                    return Center(
                      child: Image.asset(uri.toString()),
                    );
                  },
                ),
              ],
            ),
          ),
          //const UtterancesWidget(),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout(String? article) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 8, 5.w, 8),
            child: Column(
              children: <Widget>[
                MarkdownBody(
                  data: article ?? '',
                  //shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: WrapAlignment.spaceEvenly,
                  ),
                  imageBuilder: (uri, title, alt) {
                    return Center(
                      child: Image.asset(uri.toString()),
                    );
                  },
                ),
              ],
            ),
          ),
          //const UtterancesWidget(),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget largeScreenLayout(String? article) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 8, 20.w, 8),
            child: Column(
              children: <Widget>[
                // If there is scrollable parent, use MarkdownBody
                // instead of shrinkwrap: true.
                MarkdownBody(
                  data: article ?? '',
                  //shrinkWrap: true,
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: WrapAlignment.spaceEvenly,
                  ),
                  imageBuilder: (uri, title, alt) {
                    return Center(
                      child: Image.asset(uri.toString()),
                    );
                  },
                ),
              ],
            ),
          ),
          //const UtterancesWidget(),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Future<String> getArticle() async {
    final String article = await rootBundle
        .loadString('assets/articles/2022/02_article/article_16Mar2022.md');
    return article;
  }
}
