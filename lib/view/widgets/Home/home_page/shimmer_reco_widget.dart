import 'package:flutter/material.dart';


class ShimmerRecommendedWidget extends StatelessWidget {
  const ShimmerRecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 60,
            right: 40,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(
                  right: 16, top: 15, left: 40),
              color: Theme.of(context).colorScheme.primary,
            )), // yellow Type and Number
        Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width * 0.77,
          color: Theme.of(context).colorScheme.primary,
        ), // backGroundColor
        Container(
          padding:
          const EdgeInsets.symmetric(vertical: 10),
          height: 200,
          width: MediaQuery.sizeOf(context).width * 0.77,
          color: Colors.black.withOpacity(0.7),),
      ],
    );
  }
}