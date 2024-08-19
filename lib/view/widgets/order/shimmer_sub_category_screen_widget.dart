import 'package:flutter/material.dart';

import '../../../core/function/build_grid_delegatee.dart';
import '../Global_Shimmer/ShimmerEffect.dart';
import '../Global_Shimmer/shimmer_item_widget.dart';
import '../Global_Widget/my_custom_scroll.dart';

class ShimmerSubCategoryScreenWidget extends StatelessWidget {
  const ShimmerSubCategoryScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: MyCustomScroll(
        marginFromTop: 30,
        marginFromDown: 30,
        child: SliverGrid(
          gridDelegate: buildGridDelegate(),
          delegate: SliverChildBuilderDelegate((context, index) {
            return const ShimmerItemWidget();
          }, childCount: 10),
        ),
      ),
    );
  }
}