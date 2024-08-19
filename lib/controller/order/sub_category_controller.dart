import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/data/datasource/dynamic/sub_category_data.dart';

import '../../data/model/sub_category_product.dart';

class SubCategoryController extends GetxController {
  int _subCategoryScreen = 0;
  SubCategoryController(this.categoryId);
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late final Function(GlobalKey) runAddToCartAnimation;
  final int categoryId;
  final SubCategoryData _repository = SubCategoryData();
  final RxList<SubCategoryProduct> listSubCategoryItems =
      RxList<SubCategoryProduct>();
  final RxBool isLoading = false.obs;

  // for page view
  bool changeFromController = false;
  final PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
    getListSubCategory();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  Future<void> getListSubCategory() async {
    try {
      isLoading.value = true;
      final categoryListItems =
          await _repository.getSubCategoryListItems(categoryId);
      listSubCategoryItems.assignAll(categoryListItems);
    } finally {
      isLoading.value = false;
    }
  }

  int get subCategoryScreen => _subCategoryScreen;

  set subCategoryScreen(int value) {
    _subCategoryScreen = value;
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    update();
  }
}
