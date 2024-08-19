import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop/controller/order/item_card_controller.dart';

import '../../../../data/model/custom_icon.dart';
import '../custom_icon_widget.dart';

class FilterIconsWidget extends StatelessWidget {
  const FilterIconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ItemCardController itemCardController = Get.find();
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
          onTap: () {
            itemCardController.isLike = !itemCardController.isLike;
          },
          child: GetBuilder<ItemCardController>(
            builder: (controller) => CustomIconWidget(
                customIcon: CustomIcon(
                    image: 'assets/icons/blood_like.svg',
                    imageClick: 'assets/icons/LikeOutline.svg',
                    head: 'I Like\nIt'),
                isToggled: itemCardController.isLike),
          )), // Like
      InkWell(
          onTap: () {
            itemCardController.isDelicious = !itemCardController.isDelicious;
          },
          child: GetBuilder<ItemCardController>(
            builder: (controller) => CustomIconWidget(
                customIcon: CustomIcon(
                    image: 'assets/icons/blood_star.svg',
                    imageClick: 'assets/icons/StartOutline.svg',
                    head: 'Good\nPrice'),
                isToggled: itemCardController.isDelicious),
          )), //
      InkWell(
        onTap: () {
          itemCardController.isGood = !itemCardController.isGood;
        },
        child: GetBuilder<ItemCardController>(
          builder: (controller) => CustomIconWidget(
              customIcon: CustomIcon(
                image: 'assets/icons/blood_delicious.svg',
                imageClick: 'assets/icons/SpoonOutline.svg',
                head: 'Highly\nRated',
              ),
              isToggled: itemCardController.isGood),
        ),
      ), //
    ]);
  }
}
