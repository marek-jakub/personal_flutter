//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Marek Jakub: Articles'),
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
          body: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: screenWidth < 700
                  ? smallScreenLayout()
                  : screenWidth < 1200
                      ? mediumScreenLayout()
                      : largeScreenLayout(),
            ),
          ),
        );
      },
    );
  }

  Widget smallScreenLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          const CustomDateText(
            date: '2023',
            fontSize: 15,
          ),
          const CustomDateText(
            date: '2022',
            fontSize: 15,
          ),
          const CustomDateText(
            date: '2021',
            fontSize: 15,
          ),
          const CustomClickableArticle(
            date: '20 Nov 2021',
            articleName: 'An old-fashioned library (bookcase)',
            articlePath: '/bookcase',
            fontSize: 12,
          ),
          const CustomClickableArticle(
            date: '01 Sep 2021',
            articleName: 'From binary tree to exponential search',
            articlePath: '/binarytree',
            fontSize: 12,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          const CustomDateText(
            date: '2023',
            fontSize: 17,
          ),
          const CustomDateText(
            date: '2022',
            fontSize: 17,
          ),
          const CustomDateText(
            date: '2021',
            fontSize: 17,
          ),
          const CustomClickableArticle(
            date: '20 Nov 2021',
            articleName: 'An old-fashioned library (bookcase)',
            articlePath: '/bookcase',
            fontSize: 15,
          ),
          const CustomClickableArticle(
            date: '01 Sep 2021',
            articleName: 'From binary tree to exponential search',
            articlePath: '/binarytree',
            fontSize: 15,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }

  Widget largeScreenLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const CustomNavButtons(),
          const CustomDateText(
            date: '2023',
            fontSize: 18,
          ),
          const CustomDateText(
            date: '2022',
            fontSize: 18,
          ),
          const CustomDateText(
            date: '2021',
            fontSize: 18,
          ),
          const CustomClickableArticle(
            date: '20 Nov 2021',
            articleName: 'An old-fashioned library (bookcase)',
            articlePath: '/bookcase',
            fontSize: 15,
          ),
          const CustomClickableArticle(
            date: '01 Sep 2021',
            articleName: 'From binary tree to exponential search',
            articlePath: '/binarytree',
            fontSize: 15,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }
}
