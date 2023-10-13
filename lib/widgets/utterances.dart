import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

class UtterancesWidget extends StatelessWidget {
  const UtterancesWidget({super.key});

  final String viewID = "utterances";

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewID,
      (int id) => html.IFrameElement()
        ..width = MediaQuery.of(context).size.width.toString()
        ..height = MediaQuery.of(context).size.height.toString()
        ..src = 'assets/utterances.html'
        ..style.border = 'none',
    );

    return SizedBox(
      height: 570,
      child: HtmlElementView(
        viewType: viewID,
      ),
    );
  }
}
