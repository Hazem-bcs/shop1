import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/core/constant/routes.dart';

import '../../../controller/cart_controller.dart';
import '../../my_app_bar.dart';

PreferredSize buildAppBar(
    {required GlobalKey<CartIconKey> cartKey, Color? color}) {
  final CartController cartController = Get.find();
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: MyAppBar(
      color: color,
      actions: [
        Padding(
          key: cartKey,
          padding: const EdgeInsets.only(right: 40),
          child: InkWell(
            onTap: () {
              cartController.getListCart();
              Get.toNamed(AppRoute.cartScreen);
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromARGB(255, 90, 90, 90),
              child: SvgPicture.asset(
                'assets/icons/cartIcon.svg',
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
