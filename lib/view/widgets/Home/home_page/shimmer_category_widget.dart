import 'package:flutter/material.dart';

import '../horizintal_list_view_widget.dart';

class ShimmerCategoryHomePageWidget extends StatelessWidget {
  const ShimmerCategoryHomePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetHorizontalListView(
        height: 60,
        itemCount: 10, // Number of shimmer items you want to show
        itemBuilder: (_, index) => Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(50)
          ),
        )
    );
  }
}