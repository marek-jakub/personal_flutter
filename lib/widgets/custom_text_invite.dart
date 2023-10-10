import 'package:flutter/material.dart';

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
    required double titleSize,
    required double fontSize,
    required Color boxColor,
  })  : _width = width,
        _height = height,
        _date = date,
        _articleName = articleName,
        _articlePath = articlePath,
        _articleText = articleText,
        _titleSize = titleSize,
        _fontSize = fontSize,
        _boxColor = boxColor,
        super(key: key);

  final double _width;
  final double _height;
  final String _date;
  final String _articleName;
  final String _articlePath;
  final String _articleText;
  final double _titleSize;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                _date,
                style: TextStyle(
                  fontSize: _fontSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                _articleName,
                style: TextStyle(fontSize: _titleSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
              child: Text(
                _articleText,
                textAlign: TextAlign.justify,
                softWrap: true,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: _fontSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, _articlePath);
                },
                child: const Text('<< Continue reading >>'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
