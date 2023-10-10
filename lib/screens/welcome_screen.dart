import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';
import '../screens/articles/invite_text.dart';

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
    final TextInvite invite = TextInvite();

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
                  ? smallScreenLayout(invite)
                  : screenWidth < 1200
                      ? mediumScreenLayout(invite)
                      : largeScreenLayout(invite),
            ),
          ),
        );
      },
    );
  }

  Widget smallScreenLayout(TextInvite invite) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('small screen layout'),
        ],
      ),
    );
  }

  Widget mediumScreenLayout(TextInvite invite) {
    return const Column(
      children: [
        Text('medium screen layout'),
      ],
    );
  }

  Widget largeScreenLayout(TextInvite invite) {
    return Container(
      width: 1400,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: '01 Sep 2021',
                  articleName: 'Article name',
                  articlePath: 'Article path',
                  articleText: 'Sljksadf asdlfkj sdlfkja sa;dflk sflk j',
                  fontSize: 16,
                  boxColor: Colors.yellow),
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: invite.article5['articleDate'].toString(),
                  articleName: invite.article5['articleName'].toString(),
                  articlePath: '/traversal',
                  articleText: invite.article5['articleText'].toString(),
                  fontSize: 16,
                  boxColor: Colors.brown),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: invite.article4['articleDate'].toString(),
                  articleName: invite.article4['articleName'].toString(),
                  articlePath: '/solvenot',
                  articleText: invite.article4['articleText'].toString(),
                  fontSize: 16,
                  boxColor: Colors.red),
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: invite.article3['articleDate'].toString(),
                  articleName: invite.article3['articleName'].toString(),
                  articlePath: '/hunt',
                  articleText: invite.article3['articleText'].toString(),
                  fontSize: 16,
                  boxColor: Colors.black),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: invite.article2['articleDate'].toString(),
                  articleName: invite.article2['articleName'].toString(),
                  articlePath: '/bookcase',
                  articleText: invite.article2['articleText'].toString(),
                  fontSize: 16,
                  boxColor: Colors.blue),
              CustomContainer(
                  width: 500,
                  height: 500,
                  date: invite.article1['articleDate'].toString(),
                  articleName: invite.article1['articleName'].toString(),
                  articlePath: '/binarytree',
                  articleText: invite.article1['articleText'].toString(),
                  fontSize: 16,
                  boxColor: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
