import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/core/function/my_snack_bar.dart';

import '../../../../core/constant/routes.dart';
import '../../custom_button_widget.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
    required this.userId,
  });
  final int userId;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonWidget(
          onPressed: () {
            Get.back();
          },
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                "Add more",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        CustomButtonWidget(
          onPressed: () {
            if (cartController.cartList.isEmpty) {
              mySnackBar('pleas add products before you order 😊');
            } else {
              Get.toNamed(AppRoute.locationScreen);
            }
          },
          child: Row(
            children: [
              Text(
                "Check out",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        )
      ],
    );
  }
}
