import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/controller/favorite_controller.dart';
import 'package:shop/core/function/getImageFromDrive.dart';

import '../../../controller/order/item_card_controller.dart';
import '../../../core/function/AppBars/build_app_bar.dart';
import '../../widgets/order/order_card/add_more_things_button_widget.dart';
import '../../widgets/order/order_card/card_name_widget.dart';
import '../../widgets/order/order_card/category_text.dart';
import '../../widgets/order/order_card/filter_icons_widget.dart';
import '../../widgets/order/order_card/go_to_cart_widget.dart';
import '../../widgets/order/order_card/number_of_pieces_widget.dart';
import '../../widgets/order/order_card/order_review_widget.dart';
import '../../widgets/order/order_card/price_and_fav_widget.dart';

import '../../../data/model/item.dart';

class ItemCardScreen extends StatelessWidget {
  const ItemCardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // get data from click
    final Map<String, dynamic> args = Get.arguments;
    final Item item = args['item'];
    final String heroTag = args['heroTag'] ?? 'defaultHeroTag';
    final int itemId = args['itemId'];
    // define controller
    final CartController cartController = Get.find();
    final FavoriteController favoriteController = Get.find();
    final favoriteList = favoriteController.favoriteList;
    Get.put(ItemCardController(itemId, favoriteList));

    return Scaffold(
      appBar: buildAppBar(cartKey: GlobalKey()),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              OrderCardCategoryWidget(category: item.category),
              const SizedBox(height: 10),
              OrderCartNameWidget(name: item.name),
              const SizedBox(height: 10),
              OrderCartReviewWidget(review: item.reviewCount),
              const SizedBox(height: 150),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        MediaQuery.of(context).size.width / 2.7,
                      ),
                      topRight: Radius.circular(
                        MediaQuery.of(context).size.width / 2.7,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Column(
                      children: [
                        Hero(
                          tag: heroTag,
                          child: Transform.translate(
                            offset: const Offset(0, -40),
                            child: Transform.scale(
                              scale: 2.6,
                              child: Image(
                                image: CachedNetworkImageProvider(
                                  getImageFromDrive(item.image),
                                ),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        PriceAndFavWidget(item: item), // price and FavIcon
                        const SizedBox(height: 30),
                        const FilterIconsWidget(), // Three Icons
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NumberOfPiecesWidget(
                              item: item,
                              cartController: cartController,
                            ),
                            GoToCartButtonWidget(
                                cartController: cartController),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const AddMoreThingsButtonWidget(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
