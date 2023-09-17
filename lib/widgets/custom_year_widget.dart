import 'package:flutter/material.dart';

/// A text widget in a sized box.
class CustomDateText extends StatelessWidget {
  const CustomDateText({
    Key? key,
    required String date,
  })  : _date = date,
        super(key: key);

  final String _date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: SizedBox(
        width: 550,
        child: Text(
          style: TextStyle(fontSize: 17),
          _date,
        ),
      ),
    );
  }
}
