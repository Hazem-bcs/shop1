import 'package:flutter/material.dart';

import '../sliver_sized_box.dart';

class MyCustomScroll extends StatelessWidget {
  const MyCustomScroll({
    super.key,
    required this.marginFromTop,
    required this.marginFromDown,
    required this.child, this.controller, this.cacheExtent,
  });
  final double marginFromTop;
  final double marginFromDown;
  final Widget child;
  final ScrollController? controller;
  final double? cacheExtent;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      cacheExtent: cacheExtent,
      slivers: [
        SliverSizedBox(
          height: marginFromTop,
        ),
        child,
        SliverSizedBox(
          height: marginFromDown,
        ),
      ],
    );
  }
}