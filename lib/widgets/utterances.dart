import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

class UtterancesWidget extends StatelessWidget {
  const UtterancesWidget({super.key});

  final String viewID = "utterances";

  final String utterances = """
<!DOCTYPE html>
<html>

<head></head>

<body>
    <div class="notecomments">
        <script src="https://utteranc.es/client.js" repo="marek-jakub/marek-jakub.github.io" issue-term="pathname"
            label="Comment" theme="github-light" crossorigin="anonymous" async>
            </script>
    </div>
</body>

</html>
""";

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewID,
      (int id) => html.IFrameElement()
        ..width = MediaQuery.of(context).size.width.toString()
        ..height = MediaQuery.of(context).size.height.toString()
        ..src = utterances
        ..style.border = 'none',
    );

    return SizedBox(
      height: 570,
      child: HtmlElementView(
        viewType: viewID,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // ignore: undefined_prefixed_name
  //   ui.platformViewRegistry.registerViewFactory(
  //     viewID,
  //     (int id) => html.IFrameElement()
  //       ..width = MediaQuery.of(context).size.width.toString()
  //       ..height = MediaQuery.of(context).size.height.toString()
  //       ..src = 'assets/utterances.html'
  //       ..style.border = 'none',
  //   );

  //   return SizedBox(
  //     height: 570,
  //     child: HtmlElementView(
  //       viewType: viewID,
  //     ),
  //   );
  // }
}
