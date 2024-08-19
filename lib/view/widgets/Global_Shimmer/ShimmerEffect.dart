import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
