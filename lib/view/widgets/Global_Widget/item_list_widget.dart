import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/function/AppBars/build_app_bar.dart';
import '../../../data/model/item.dart';
import '../item_widget.dart';
import '../sliver_sized_box.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(
      {super.key, required this.controller, required this.list});

  final dynamic controller;
  final List<Item> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(cartKey: controller.cartKey),
      body: CustomScrollView(
        slivers: [
          const SliverSizedBox(
            height: 10,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    AnimationLimiter(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    Get.toNamed(AppRoute.itemCardScreen,
                                        arguments: {
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
          ),
          const SliverSizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    await controller.runAddToCartAnimation(widgetKey);
  }
}
