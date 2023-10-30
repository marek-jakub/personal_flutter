import 'package:flutter/material.dart';
import 'package:personalme/models/models.dart';
import 'package:provider/provider.dart';

/// Website Mode Selection switch.
class CustomModeSelection extends StatefulWidget {
  const CustomModeSelection({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomModeSelection> createState() => _CustomModeSelectionState();
}

class _CustomModeSelectionState extends State<CustomModeSelection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateManager>(
      builder: (context, stateManager, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                stateManager.setDarkMode = !stateManager.darkMode;
              },
              icon: _showIcon(stateManager),
            ),
            // const Icon(Icons.light_mode),
            // Switch(
            //   value: stateManager.darkMode,
            //   onChanged: (value) {
            //     stateManager.setDarkMode = value;
            //   },
            // ),
            // const Icon(Icons.dark_mode),
          ],
        );
      },
    );
  }

  Icon _showIcon(StateManager stateManager) {
    Icon mode = const Icon(Icons.light_mode);
    if (stateManager.darkMode) {
      mode = const Icon(Icons.dark_mode);
    }
    return mode;
  }
}
