import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/view/widgets/sliver_sized_box.dart';

import '../../../controller/order/category_controller.dart';
import '../../../data/model/category.dart';
import '../../widgets/Home/search_text.dart';

import '../../widgets/Home/shimmer_category_widget.dart';
import '../../widgets/category_card_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final CategoryController _controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            const SliverSizedBox(height: 35),
            const SliverToBoxAdapter(child: SearchTextFieldMine()),
            Obx(() => _controller.isLoading.value?
            const ShimmerCategoryWidget():
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: _controller.listCategories.length,
                        (context, index) {
                      Category category = _controller.listCategories[index];
                      return CategoryCardWidget(
                        title: category.categoryName!,
                        image: category.categoryImage,
                        categoryId: category.categoryId,
                      );
                    }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 190,
                ))),
            const SliverSizedBox(height: 70),
          ],
        ),
      ],
    );
  }
}