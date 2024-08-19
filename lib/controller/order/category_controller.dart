import 'package:shop/data/datasource/dynamic/category_data.dart';

import '../../data/model/category.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class CategoryController extends GetxController {
  final CategoryData _repository = CategoryData();
  RxList<Category> listCategories = RxList<Category>();
  final RxBool isLoading = true.obs;

  Artboard? _riveArtBord;
  SMIInput<bool>? _searchHover;

  Future<void> loadAnimation() async {

    rootBundle.load('assets/animations/pub.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      final controller =
      StateMachineController.fromArtboard(artboard, 'pup demo');
      if (controller != null) {
        artboard.addController(controller);
        setHoverOrNot(controller.findInput('searchHover'));
        setRiveArtBord(artboard);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadAnimation();
    getCategoryData();
  }

  void setHoverOrNot(SMIInput<bool>? value) {
    _searchHover = value;
  }

  void setHoverOrNotValue(bool value) {
    _searchHover?.value = value;
  }

  void setRiveArtBord(Artboard? artboard) {
    _riveArtBord = artboard;
    update();
  }

  Artboard? getRiveArtBord() {
    return _riveArtBord;
  }

  Future<void> getCategoryData() async {
    try {
      isLoading.value = true;
      final categoryList = await _repository.getListCategory();
      listCategories.assignAll(categoryList);
    } finally {
      isLoading.value = false;
    }
  }
}