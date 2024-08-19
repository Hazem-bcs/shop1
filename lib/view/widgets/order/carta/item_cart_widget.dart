import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/core/function/getImageFromDrive.dart';

import '../../../../data/model/item.dart';
import '../trush_icon.dart';


class ItemCartWidget extends StatelessWidget {
  const ItemCartWidget({
    super.key,
    required this.item, this.withSizedBox = false,
  });

  final Item item;
  final bool? withSizedBox;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Container(
                  color: Color(int.parse(item.background)),
                  width: 100,
                  height: 150,
                  child: FractionallySizedBox(
                    widthFactor: 120 / 120,
                    heightFactor: 100 / 150,
                    child: CachedNetworkImage(
                      imageUrl: getImageFromDrive(item.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'FRUIT',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    letterSpacing: 5,
                                    fontSize: 14),
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(color: Colors.white,fontSize: 22),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "⭐ (${item.reviewCount} reviews)",
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$${item.price} ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.75)),
                                    ),
                                    const Text(
                                      'per one',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    )
                                  ])
                            ],
                          ),
                          Row(
                            children: [ Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TrashIcon(itemId: item.id,),
                              ],
                            ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                    child: IconButton(
                                        onPressed: () {
                                          cartController.add(item);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                    width: 42,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: GetBuilder<CartController>(
                                          builder: (controller) => Text(
                                            item.numberOfPieces.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        )),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                    child: IconButton(
                                        onPressed: () {
                                          cartController.remove(item);
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                  ),
                                ],
                              )],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        if (withSizedBox!) ...[
          const SizedBox(height: 25),
        ]
      ],
    );
  }
}
