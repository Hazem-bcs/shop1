import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../controller/home/search_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/AppBars/build_app_bar.dart';
import '../../../data/model/item.dart';
import '../../widgets/Home/search_text.dart';
import '../../widgets/add_to_cart_animation_widget.dart';
import '../../widgets/item_widget.dart';
import '../../widgets/sliver_sized_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySearchController searchController = Get.find();
    return AddToCartAnimationWidget(
      controller: searchController,
      dontRepeat: searchController.getDontRepeat(),
      child: Scaffold(
        appBar: buildAppBar(cartKey: searchController.cartKey),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  SearchTextFieldMine(
                    hintText: "Search in the shop",
                  ),
                ],
              ),
            ),
            const SliverSizedBox(
              height: 20,
            ),
            Obx(() => searchController.isLoading.value
                ? const SliverToBoxAdapter(
                    child: RiveLogoWidget(
                      asset: 'assets/animations/search_loading.riv',
                    ),
                  )
                : searchController.listItems.isEmpty
                    ? SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const RiveLogoWidget(
                              asset: 'assets/animations/no_found_search.riv',
                            ),
                            Text(
                              "Not Found",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5),
                                      fontSize: 25),
                            )
                          ],
                        ),
                      )
                    : ListItemSearchWidget(
                        controller: searchController,
                        list: searchController.listItems)),
            const SliverSizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class RiveLogoWidget extends StatelessWidget {
  const RiveLogoWidget({
    super.key,
    required this.asset,
  });
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Center(
        child: SizedBox(
            width: 200, height: 300, child: RiveAnimation.asset(asset)),
      ),
    );
  }
}

class ListItemSearchWidget extends StatelessWidget {
  const ListItemSearchWidget(
      {super.key, required this.controller, required this.list});

  final dynamic controller;
  final List<Item> list;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              AnimationLimiter(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 290,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final Item item = list[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 2,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ItemWidget(
                            onTap: () {
                              Get.toNamed(AppRoute.itemCardScreen, arguments: {
                                'item': item,
                                'heroTag': item.id.toString(),
                                'itemId': item.id,
                              });
                            },
                            item: item,
                            heroTag: 'view-All${item.id}',
                            index: index,
                            onClick: listClick,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await controller.runAddToCartAnimation(widgetKey);
  }
}
