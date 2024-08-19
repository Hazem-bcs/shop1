import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';

class TrashIcon extends StatelessWidget {
  const TrashIcon({
    super.key, required this.itemId,
  });
  final int itemId;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(onPressed: () {
        cartController.drop(itemId);
      }, icon: SvgPicture.asset(
        'assets/icons/trush_2.svg',
        color: Colors.redAccent,
        width: 25,
        height: 25,
      ),),
    );
  }
}