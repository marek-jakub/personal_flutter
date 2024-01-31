import 'package:flutter/material.dart';

/// A BottomBar with copyright and date.
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('2024'),
            Icon(Icons.copyright),
            Text('Marek Jakub'),
          ],
        ),
      ),
    );
  }
}
