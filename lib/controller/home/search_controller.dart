import 'dart:async';

import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/data/datasource/dynamic/search_data.dart';

import '../../data/model/item.dart';

class MySearchController extends GetxController {
  bool isShort = false;
  bool dontRepeat = false;
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  final RxBool isLoading = false.obs;
  late final Function(GlobalKey) runAddToCartAnimation;
  final RxList<Item> listItems = RxList<Item>();
  final SearchData _repository = SearchData();
  Timer? _debounce;
  bool getDontRepeat() {
    bool temp = dontRepeat;
    dontRepeat = true;
    return temp;
  }

  Future<void> searchOnData(String text) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 750), () async {
      try {
        isLoading.value = true;
        final listItemsRepo = await _repository.getListFavoriteItem(text);
        listItems.assignAll(listItemsRepo);
      } finally {
        isLoading.value = false;
      }
    });
  }

  bool checkIsShort(String text) {
    if (text.length <= 2) {
      isShort = true;
      return isShort;
    } else {
      isShort = false;
      return isShort;
    }
  }

  void _debounceUpsertUserFavorite(String text) {}
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _debounce?.cancel(); // turn off to Timer
  }
}
