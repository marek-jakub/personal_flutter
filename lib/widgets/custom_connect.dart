import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A text widget in a sized box.
class CustomConnectText extends StatelessWidget {
  const CustomConnectText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.w, 10, 2.w, 25),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: 80.w,
        child: const Text(
          style: TextStyle(fontSize: 17),
          'email',
        ),
      ),
    );
  }
}
