import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/core/constant/routes.dart';

class CartaWidget extends StatelessWidget {
  const CartaWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return InkWell(
      onTap: () {
        cartController.getListCart();
        Get.toNamed(AppRoute.cartScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          width: 20,
          height: 20,
          'assets/icons/cartIcon.svg',
          color: Colors.white,
        ),
      ),
    );
  }
}
