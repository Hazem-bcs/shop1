import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/favorite_list_controller.dart';
import 'package:shop/controller/order/item_card_controller.dart';

import '../../../../data/model/item.dart';
import '../../Global_Widget/animation_svg_widget.dart';

class PriceAndFavWidget extends StatelessWidget {
  const PriceAndFavWidget({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    final ItemCardController itemCardController = Get.find();
    final FavoriteListController favoriteListController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$ ${item.price}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "PER KG",
              style: TextStyle(
                  color: Color.fromARGB(255, 174, 173, 173), letterSpacing: 5),
            )
          ],
        ),
        InkWell(
          onTap: () {
            itemCardController.isFavorite = !itemCardController.isFavorite;
            final int currentId = item.id;
            favoriteListController.listBestItems
                .removeWhere((item) => item.id == currentId);
            favoriteListController.updateGet();
          },
          child: GetBuilder<ItemCardController>(
            builder: (controller) => AnimationSvgWidget(
              isIt: 'assets/icons/heartIcon.svg',
              isNot: 'assets/icons/heart_out_line.svg',
              isToggled: itemCardController.isFavorite,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
