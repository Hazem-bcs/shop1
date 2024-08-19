import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';

import '../../../../core/constant/routes.dart';

class GoToCartButtonWidget extends StatelessWidget {
  const GoToCartButtonWidget({
    super.key, required this.cartController,
  });
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          cartController.getListCart();
          Get.toNamed(AppRoute.cartScreen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 20),
          height: 45,
          decoration: BoxDecoration(
              color:
              Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(
                  Radius.circular(13))),
          child: Row(
            children: [
              const Text(
                'Go To Cart',
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 2, 67),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                'assets/icons/arrowRight.svg',
                width: 20,
                height: 20,
                color:
                const Color.fromARGB(255, 6, 2, 67),
              ),
            ],
          ),
        ));
  }
}