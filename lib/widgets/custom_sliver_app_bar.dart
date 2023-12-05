import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

/// Website sliver app bar.
class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({
    Key? key,
    required Widget container,
  })  : _container = container,
        super(key: key);

  final Widget _container;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          pinned: false,
          snap: true,
          expandedHeight: 65.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/'),
                  child: const Image(
                    width: 60,
                    height: 60,
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/02_logo.png'),
                  ),
                ),
              ),
              const Flexible(
                fit: FlexFit.loose,
                child: CustomNavigation(),
              ),
              const Flexible(
                fit: FlexFit.loose,
                child: CustomModeSelection(),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: widget._container,
        ),
      ],
    );
  }
}
