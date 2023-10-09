import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:sizer/sizer.dart';

/// A container with visible sides and text inside.
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required double width,
    required double height,
    required String date,
    required String articleName,
    required String articlePath,
    required String articleText,
    required double fontSize,
    required Color boxColor,
  })  : _width = width,
        _height = height,
        _date = date,
        _articleName = articleName,
        _articlePath = articlePath,
        _articleText = articleText,
        _fontSize = fontSize,
        _boxColor = boxColor,
        super(key: key);

  final double _width;
  final double _height;
  final String _date;
  final String _articleName;
  final String _articlePath;
  final String _articleText;
  final double _fontSize;
  final Color _boxColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          border: Border.all(
            color: _boxColor,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(_date),
                Text(
                  _articleName,
                  style: TextStyle(fontSize: _fontSize),
                ),
              ],
            ),
            Text(
              _articleName,
              style: TextStyle(fontSize: _fontSize),
            ),
            Text(_articleText),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, _articlePath);
              },
              child: const Text('<< Continue reading >>'),
            ),
          ],
        ),
      ),
    );
  }
}