import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/function/get_total_price.dart';

import '../../../../controller/cart_controller.dart';

class CartaPriceWidget extends StatelessWidget {
  const CartaPriceWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      final double price = getTotalPrice(controller.cartList);
      price.toStringAsFixed(0);
      return Text(
        "Totally \$ $price",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      );
    });
  }
}
