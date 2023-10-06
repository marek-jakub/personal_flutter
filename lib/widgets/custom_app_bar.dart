import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:sizer/sizer.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../models/models.dart';
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
    return Consumer<StateManager>(
      builder: (constext, stateManager, child) {
        return AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: Image(
                  width: 60,
                  height: 60,
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/images/02_logo.png'),
                ),
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomNavigation(),
                  const Icon(Icons.light_mode),
                  Switch(
                    value: stateManager.darkMode,
                    onChanged: (value) {
                      stateManager.setDarkMode = value;
                    },
                  ),
                  const Icon(Icons.dark_mode),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
