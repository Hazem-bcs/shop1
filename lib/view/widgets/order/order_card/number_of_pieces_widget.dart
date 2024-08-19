import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/cart_controller.dart';
import '../../../../data/model/item.dart';

class NumberOfPiecesWidget extends StatelessWidget {
  const NumberOfPiecesWidget({
    super.key,
    required this.item,
    required this.cartController,
  });

  final Item item;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0XFF262626),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (item.numberOfPieces > 0) {
                cartController.remove(item);
              } else {
                Get.showSnackbar(const GetSnackBar(
                  messageText: Text(
                    "can't order minus item",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/minus-solid.svg',
              width: 14,
              height: 14,
              color: const Color.fromARGB(255, 157, 157, 157),
            ),
          ),
          GetBuilder<CartController>(
            builder: (controller) => Text(
              item.numberOfPieces.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          IconButton(
            iconSize: 14,
            onPressed: () {
              if (item.numberOfPieces < item.stock) {
                cartController.add(item);
              } else {
                Get.showSnackbar(const GetSnackBar(
                  messageText: Text(
                    "out of stock",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/plus-solid.svg',
              width: 14,
              height: 14,
              color: const Color.fromARGB(255, 157, 157, 157),
            ),
          ),
        ],
      ),
    );
  }
}