import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shop/core/constant/routes.dart';

import 'package:shop/view/widgets/add_to_cart_animation_widget.dart';

import '../../../controller/order/sub_category_controller.dart';

import '../../../core/function/build_grid_delegatee.dart';

import '../../../core/function/AppBars/build_sub_category_app_bar.dart';
import '../../widgets/Global_Widget/my_custom_scroll.dart';
import '../../widgets/order/shimmer_sub_category_screen_widget.dart';

import '../../widgets/item_widget.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int categoryID = Get.arguments[0];
    final SubCategoryController controller =
        Get.put(SubCategoryController(categoryID));
    return AddToCartAnimationWidget(
      controller: controller,
      dontRepeat: false,
      child: Scaffold(
        appBar: buildSubCategoryAppBar(context, controller),
        body: Obx(
          () => controller.isLoading.value
              ? const ShimmerSubCategoryScreenWidget()
              : GetBuilder<SubCategoryController>(
                  builder: (c) {
                    return PageView.builder(
                      onPageChanged: (index) {
                        if (!controller.changeFromController) {
                          controller.subCategoryScreen = index;
                          Future.delayed(const Duration(milliseconds: 200), () {
                            controller.changeFromController = false;
                          });
                        }
                      },
                      controller: controller.pageController,
                      itemBuilder: (context, listIndex) {
                        final itemCount = controller
                            .listSubCategoryItems[listIndex].listItem.length;
                        return MyCustomScroll(
                          marginFromTop: 30,
                          marginFromDown: 30,
                          child: SliverGrid(
                            gridDelegate: buildGridDelegate(),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                int delay = 200;
                                if (index >= 10) delay = 100;
                                if (index >= 20) delay = 5;
                                final category =
                                    controller.listSubCategoryItems[listIndex];
                                final item = category.listItem[index];
                                return AnimationConfiguration.staggeredGrid(
                                  delay: Duration(milliseconds: delay),
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  columnCount: itemCount,
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
                                        heroTag: 'sub_category${item.id}',
                                        index: 1,
                                        onClick: listClick,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              childCount: itemCount,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.listSubCategoryItems.length,
                    );
                  },
                ),
        ),
      ),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    final SubCategoryController controller = Get.find<SubCategoryController>();
    await controller.runAddToCartAnimation(widgetKey);
  }
}
