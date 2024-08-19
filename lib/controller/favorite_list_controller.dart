import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/dynamic/cart/favorite_list_data.dart';
import '../data/model/item.dart';

class FavoriteListController extends GetxController {
  bool dontRepeat = false;
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final RxBool isLoading = true.obs;
  late final Function(GlobalKey) runAddToCartAnimation;
  final RxList<Item> listBestItems = RxList<Item>();
  final FavoriteListData _repository = FavoriteListData();
  bool getDontRepeat() {
    bool temp = dontRepeat;
    dontRepeat = true;
    return temp;
  }

  Future<void> getData() async {
    try {
      isLoading.value = true;
      final listBestItemsRepo = await _repository.getListFavoriteItem(1);
      listBestItems.assignAll(listBestItemsRepo);
    } finally {
      isLoading.value = false;
    }
  }

  void updateGet() {
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    getData();
  }
}
