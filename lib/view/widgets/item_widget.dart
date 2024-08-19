import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/core/function/getImageFromDrive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/model/item.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget(
      {super.key,
      required this.item,
      this.onTap,
      required this.heroTag,
      required this.index,
      this.onClick});

  final Item item;
  final String heroTag;
  final void Function()? onTap;
  final GlobalKey widgetKey = GlobalKey();
  final int index;
  final void Function(GlobalKey)? onClick;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.itemCardScreen, arguments: {
            'item': item,
            'heroTag': heroTag,
            'itemId': item.id,
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0),
              height: 120,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Color(toInt(item.background) == null
                    ? 0XFF024353
                    : toInt(item.background)!), // backGroundColor
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(300),
                  topRight: Radius.circular(300),
                ),
              ),
              child: Hero(
                tag: heroTag,
                child: Container(
                  key: widgetKey,
                  width: 60,
                  height: 60,
                  color: Colors.transparent,
                  child: CachedNetworkImage(
                    imageUrl: getImageFromDrive(item.image),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      item.category,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 5,
                          fontSize: 10),
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "⭐ (${item.reviewCount} reviews)",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
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
                  ]),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: IconButton(
                        onPressed: () {
                          bool result = cartController.add(item);
                          if (result) {
                            onClick!(widgetKey);
                          }
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    width: 42,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GetBuilder<CartController>(
                          builder: (controller) => Text(
                            item.numberOfPieces.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: IconButton(
                        onPressed: () {
                          cartController.remove(item);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
