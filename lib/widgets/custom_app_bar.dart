import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:sizer/sizer.dart';
//import 'package:flutter_sizer/flutter_sizer.dart';

//import '../models/models.dart';
import '../widgets/widgets.dart';

/// Website app bar.
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Image(
              width: 60,
              height: 60,
              fit: BoxFit.scaleDown,
              image: AssetImage('assets/images/02_logo.png'),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: CustomNavigation(),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: CustomModeSelection(),
          ),
        ],
      ),
    );
  }
}
