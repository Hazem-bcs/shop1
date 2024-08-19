import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryWidget extends StatelessWidget {
  const ShimmerCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount: 10,
                (context, index) {
              return Shimmer.fromColors(
                baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: 100,
                  height: 100,),
              );
            }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 190,
        ));
  }
}