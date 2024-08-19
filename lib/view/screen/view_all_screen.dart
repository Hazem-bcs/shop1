import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shop/controller/home/view_all_controller.dart';
import 'package:shop/view/widgets/add_to_cart_animation_widget.dart';
import '../widgets/Global_Widget/item_list_widget.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final list = Get.arguments();
    final ViewAllController viewAllController = Get.put(ViewAllController());
    return AddToCartAnimationWidget(
      controller: viewAllController,
      dontRepeat: false,
      child: ListItemWidget(
        list: list,
        controller: viewAllController,
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    final ViewAllController controller = Get.find<ViewAllController>();
    await controller.runAddToCartAnimation(widgetKey);
  }
}
