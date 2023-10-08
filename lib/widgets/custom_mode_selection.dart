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
            const Icon(Icons.light_mode),
            Switch(
              value: stateManager.darkMode,
              onChanged: (value) {
                stateManager.setDarkMode = value;
              },
            ),
            const Icon(Icons.dark_mode),
          ],
        );
      },
    );
  }
}
