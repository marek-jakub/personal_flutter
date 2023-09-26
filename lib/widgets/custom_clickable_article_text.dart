import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:sizer/sizer.dart';

/// A rich text widget with clickable text.
class CustomClickableArticle extends StatelessWidget {
  const CustomClickableArticle({
    Key? key,
    required String date,
    required String articleName,
    required String articlePath,
    required double fontSize,
  })  : _date = date,
        _articleName = articleName,
        _articlePath = articlePath,
        _fontSize = fontSize,
        super(key: key);

  final String _date;
  final String _articleName;
  final String _articlePath;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$_date >> ',
        style: TextStyle(
          fontSize: _fontSize,
        ),
        children: <TextSpan>[
          TextSpan(
              text: _articleName,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, _articlePath);
                },
              style: TextStyle(
                fontSize: _fontSize,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
