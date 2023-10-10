import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:markup_text/markup_text.dart';
//import 'package:sizer/sizer.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<StateManager>(builder: (context, stateManager, child) {
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
    });
  }

  Widget smallScreenLayout() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Column(
              children: <Widget>[
                const Image(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/MJ_small.jpg'),
                  width: 300,
                  height: 210,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 60.w,
                    height: 30.h,
                    child: MarkupText(
                      getMarkupText(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 400),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget mediumScreenLayout() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/MJ_small.jpg'),
                  width: 360,
                  height: 270,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: SizedBox(
                    width: 25.w,
                    height: 35.h,
                    child: MarkupText(
                      getMarkupText(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 600),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  Widget largeScreenLayout() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/MJ_small.jpg'),
                  width: 400,
                  height: 310,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: SizedBox(
                    width: 25.w,
                    height: 30.h,
                    child: MarkupText(
                      getMarkupText(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 700),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }

  String getMarkupText() {
    return "Marek Jakub is a student of Computing and Information Technologies (IT) at"
        " The Open University (The OU), Milton Keynes, UK. He holds a BSc (Hons) in"
        " Natural Sciences from the same university. When he is not engaged in study,"
        " he might be found occupied with his other interests: biology or sport."
        " He lives in Slovakia.";
  }
}
