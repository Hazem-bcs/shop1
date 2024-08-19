import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/controller/order/item_card_controller.dart';

class AnimationSvgWidget extends StatelessWidget {
  const AnimationSvgWidget({
    super.key,
    required this.isIt,
    required this.isNot,
    required this.isToggled,
    required this.color,
  });
  final String isIt;
  final String isNot;
  final bool isToggled;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final Key uniqueKey = ValueKey<String>('${isIt}_$isNot$isToggled');
    return CircleAvatar(
      backgroundColor: const Color(0xFF262626),
      radius: 30,
      child: GetBuilder<ItemCardController>(
        builder: (controller) => AnimatedSwitcher(
          duration: const Duration(
              milliseconds: 500), // Adjust the overall animation duration
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Use a combination of scale, rotation, and fade transitions
            return ScaleTransition(
              scale: Tween(begin: 0.5, end: 1.2).animate(animation),
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
          },
          child: SvgPicture.asset(
            isToggled ? isIt : isNot,
            key: uniqueKey, // Unique key for animation
            height: 24,
            width: 24,
            color: color,
          ),
        ),
      ),
    );
  }
}
