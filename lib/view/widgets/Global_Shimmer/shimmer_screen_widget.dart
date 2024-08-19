import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreenWidget extends StatelessWidget {
  const ShimmerScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 3)),
          padding: const EdgeInsets.all(16.0),)
    );
  }
}