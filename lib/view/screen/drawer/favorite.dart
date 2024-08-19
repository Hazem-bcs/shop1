import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/view/widgets/Global_Widget/item_list_widget.dart';

import '../../../controller/favorite_list_controller.dart';

import '../../widgets/add_to_cart_animation_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteListController favoriteListController = Get.find();
    favoriteListController.getData();
    return Obx(() => favoriteListController.isLoading.value
        ? const Scaffold(
            body: Center(
              child: SizedBox(
                  width: 250,
                  height: 320,
                  child: RiveAnimation.asset('assets/animations/wait.riv')),
            ),
          )
        : AddToCartAnimationWidget(
            controller: favoriteListController,
            dontRepeat: favoriteListController.getDontRepeat(),
            child: GetBuilder<FavoriteListController>(
              builder: (controller) => ListItemWidget(
                  controller: favoriteListController,
                  list: favoriteListController.listBestItems),
            ),
          ));
  }
}
