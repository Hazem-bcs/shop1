import 'package:flutter/material.dart';

class BlurCircleWidget extends StatelessWidget {
  const BlurCircleWidget({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.color = Colors.transparent,
    required this.borderColor,
  });

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final Color? color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        bottom: bottom,
        right: right,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(500),
              border: Border.all(color: borderColor, width: 7)),
          width: width,
          height: height,
        ));
  }
}