import 'dart:async';

import 'package:get/get.dart';
import 'package:shop/controller/favorite_controller.dart';
import 'package:shop/data/model/favorite_item_model.dart';

class ItemCardController extends GetxController {
  final FavoriteController favoriteController = Get.find();
  Timer? _debounce; // this just to avoid spam repeat
  // call function {like maybe user spam click}
  late bool _isFavorite;
  late bool _isLike;
  late bool _isGood;
  late bool _isDelicious;
  final int itemId;
  final List<FavoriteItemDetailsModel> favoriteList;

  ItemCardController(this.itemId, this.favoriteList);

  // Getters
  bool get isFavorite => _isFavorite;
  bool get isLike => _isLike;
  bool get isGood => _isGood;
  bool get isDelicious => _isDelicious;

  // Setters
  set isFavorite(bool value) {
    if (_isFavorite) {
      _isFavorite = false;
    } else {
      _isFavorite = true;
    }
    update();
    _debounceUpsertUserFavorite();
  }

  set isLike(bool value) {
    if (_isLike) {
      _isLike = false;
    } else {
      _isLike = true;
    }
    update();
    _debounceUpsertUserFavorite();
  }

  set isGood(bool value) {
    if (_isGood) {
      _isGood = false;
    } else {
      _isGood = true;
    }
    update();
    _debounceUpsertUserFavorite();
  }

  set isDelicious(bool value) {
    if (_isDelicious) {
      _isDelicious = false;
    } else {
      _isDelicious = true;
    }
    update();
    _debounceUpsertUserFavorite();
  }

  void upsertUserFavorite() {
    favoriteController.upsertFavoriteList(
        itemId, 1, _isFavorite, _isGood, _isLike, _isDelicious);
  }

  void _debounceUpsertUserFavorite() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      upsertUserFavorite();
    });
  }

  void checkIfExist(int itemId) {
    _isFavorite = false;
    _isGood = false;
    _isDelicious = false;
    _isLike = false;
    for (int i = 0; i < favoriteList.length; i++) {
      if (favoriteList[i].itemId == itemId) {
        _isFavorite = favoriteList[i].isFavorite;
        _isGood = favoriteList[i].isGood;
        _isDelicious = favoriteList[i].isDelicious;
        _isLike = favoriteList[i].isLike;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkIfExist(itemId);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _debounce?.cancel(); // turn off to Timer
    favoriteController.getFavoriteItemList();
  }
}
