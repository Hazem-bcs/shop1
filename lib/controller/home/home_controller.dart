import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/data/datasource/dynamic/home_data.dart';

import '../../data/model/category.dart';
import '../../data/model/item.dart';

class HomeController extends GetxController {
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late final Function(GlobalKey) runAddToCartAnimation;
  bool thereOrder = false;
  final HomeData _repository = HomeData();
  final RxList<Category> listBestCategories = RxList<Category>();
  final RxList<Item> listBestItems = RxList<Item>();
  final RxList<Item> listMostPopular = RxList<Item>();
  final RxList<Item> listRecommendedProducts = RxList<Item>();

  // recommended Products
  int indexRecommendedProduct = 0;
  void backRecommendedProduct(int index) {
    if (index > 0) {
      indexRecommendedProduct--;
      update();
    } else {
      indexRecommendedProduct = listRecommendedProducts.length - 1;
      update();
    }
  }

  void forewordRecommendedProduct(int index) {
    indexRecommendedProduct = index;
    update();
  }

  Future<void> getHomeData() async {
    final categoryList = await _repository.getListBestCategory();
    listBestCategories.assignAll(categoryList);
    final recommendedList = await _repository.getListRecommendedItems();
    listRecommendedProducts.assignAll(recommendedList);
    final bestItems = await _repository.getListBestItems();
    listBestItems.assignAll(bestItems);
    final mostPopularItems = await _repository.getListMostPopularItems();
    listMostPopular.assignAll(mostPopularItems);
  }

  // pup animation
  SMIInput<bool>? _boolExampleInput;
  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _boolExampleInput = controller.findInput<bool>('searchHover') as SMIBool;
  }

  void makeItTrue() {
    _boolExampleInput?.value = true;
  }

  void makeItFalse() {
    _boolExampleInput?.value = false;
  }

  // text field
  final textFieldController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }
}
