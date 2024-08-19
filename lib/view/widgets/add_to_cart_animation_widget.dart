import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';

class AddToCartAnimationWidget extends StatelessWidget {
  const AddToCartAnimationWidget(
      {super.key,
      required this.controller,
      required this.child,
      required this.dontRepeat});

  final dynamic controller;
  final Widget child;
  final bool dontRepeat; // this just for Favorite Screen cuz I re get
  // to it and I initialize the controller in binding
  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
        cartKey: controller.cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
            rotation: true, duration: Duration(seconds: 1)),
        jumpAnimation:
            const JumpAnimationOptions(duration: Duration(microseconds: 500)),
        createAddToCartAnimation: (runAddToCartAnimation) {
          if (dontRepeat) {
          } else {
            controller.runAddToCartAnimation = runAddToCartAnimation;
          }
        },
        child: child);
  }
}
