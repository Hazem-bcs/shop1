import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rive/rive.dart';

import 'package:shop/controller/cart_controller.dart';

import '../../widgets/order/carta/cart_text_widget.dart';
import '../../widgets/order/carta/carta_app_bar_widget.dart';
import '../../widgets/order/order_card/carta_widget.dart';

import '../../widgets/order/carta/item_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Obx(() => cartController.isLoading.value
        ? const Scaffold(
            body: Center(
                child: SizedBox(
            height: 180,
            width: 180,
            child: RiveAnimation.asset(
              'assets/animations/cart_loader.riv',
            ),
          )))
        : GetBuilder<CartController>(
            builder: (controller) => Scaffold(
              appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(95),
                  child: CartaAppBarWidget(
                    userId: 1,
                  )),
              body: AnimatedList(
                key: cartController.listKey,
                initialItemCount: cartController.cartList.length + 2,
                itemBuilder: (context, index, animation) {
                  if (index == 0) {
                    return CartTextSection(
                      numberOfItems: cartController.cartList.length,
                      child: const CartaWidget(),
                    );
                  }
                  if (index == cartController.cartList.length + 1) {
                    return const SizedBox(height: 40);
                  }
                  return SizeTransition(
                    key: ValueKey(controller.cartList[index - 1].id),
                    sizeFactor: animation,
                    child: ItemCartWidget(
                      item: cartController.cartList[index - 1],
                      withSizedBox: true,
                    ),
                  );
                },
              ), // plus 2 for TextSection() and SizedBox in the last of the ListView
            ),
          ));
  }
}
