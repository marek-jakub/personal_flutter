import 'package:flutter/material.dart';
//import 'package:sizer/sizer.dart';

/// A text widget in a sized box.
class CustomDateText extends StatelessWidget {
  const CustomDateText({
    Key? key,
    required String date,
    required double fontSize,
  })  : _date = date,
        _fontSize = fontSize,
        super(key: key);

  final String _date;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Center(
        child: Text(
          _date,
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
    );
  }
}
