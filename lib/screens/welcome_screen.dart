import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('small screen layout'),
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    return const Column(
      children: [
        Text('medium screen layout'),
      ],
    );
  }

  Widget largeScreenLayout() {
    return Container(
      width: 1400,
      alignment: Alignment.center,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 400,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
              CustomContainer(
                  width: 500,
                  height: 400,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 200,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
              CustomContainer(
                  width: 500,
                  height: 300,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 400,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
              CustomContainer(
                  width: 500,
                  height: 200,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.brown),
            ],
          ),
        ],
      ),
    );
  }
}
