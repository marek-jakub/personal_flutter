import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          SizedBox(
            height: 12.h,
          ),
          const CustomConnectText(),
        ],
      ),
    );
  }
}
