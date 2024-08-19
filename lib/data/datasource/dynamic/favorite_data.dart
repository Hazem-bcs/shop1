import 'package:shop/data/model/favorite_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteItemDetailsData {
  final supabase = Supabase.instance.client;

  Future<List<FavoriteItemDetailsModel>> getListFavoriteItem(int userId) async {
    //Future<List<FavoriteItemDetailsModel>>
    final response =
        await supabase.rpc('get_user_favorites', params: {'p_user_id': userId});
    if (response.isNotEmpty) {
      return _getFavoriteListItems(response);
    } else {
      return [];
    }
  }

  // -- function --
  List<FavoriteItemDetailsModel> _getFavoriteListItems(List<dynamic> response) {
    final List<FavoriteItemDetailsModel> favoriteListItems = [];
    for (int recordeIndex = 0; recordeIndex < response.length; recordeIndex++) {
      final item = response[recordeIndex];
      favoriteListItems.add(FavoriteItemDetailsModel(
          isFavorite: item['is_favorite'],
          isGood: item['is_good'],
          isLike: item['is_like'],
          isDelicious: item['is_rate'],
          itemId: item['item_id']));
    }
    return favoriteListItems;
  }

  Future<void> upsertFavoriteList(
      {required int userId,
      required int itemId,
      required bool isFavorite,
      required bool isGood,
      required bool isLike,
      required bool isDelicious}) async {
    await supabase.rpc('upsert_user_favorite', params: {
      '_item_id': userId,
      '_user_id': itemId,
      '_is_favorite': isFavorite,
      '_is_like': isLike,
      '_is_good': isGood,
      '_is_rate': isDelicious,
    });
  }
}
