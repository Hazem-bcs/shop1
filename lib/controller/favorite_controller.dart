import 'package:get/get.dart';
import 'package:shop/data/datasource/dynamic/favorite_data.dart';
import 'package:shop/data/model/favorite_item_model.dart';

class FavoriteController extends GetxController {
  final FavoriteItemDetailsData _repository = FavoriteItemDetailsData();
  List<FavoriteItemDetailsModel> favoriteList = [];

  @override
  void onInit() {
    getFavoriteItemList();
    super.onInit();
  }

  // -- functions --
  void getFavoriteItemList() async {
    favoriteList = await _repository.getListFavoriteItem(1);
  }

  void upsertFavoriteList(int userId, int itemId, bool isFavorite, bool isGood,
      bool isLike, bool isDelicious) async {
    await _repository.upsertFavoriteList(
      isDelicious: isDelicious,
      isFavorite: isFavorite,
      isGood: isGood,
      isLike: isLike,
      itemId: itemId,
      userId: userId,
    );
  }
}
