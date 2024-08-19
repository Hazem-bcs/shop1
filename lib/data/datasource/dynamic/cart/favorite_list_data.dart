import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../model/item.dart';

class FavoriteListData {
  final supabase = Supabase.instance.client;

  Future<List<Item>> getListFavoriteItem(int userId) async {
    final response = await supabase
        .rpc('get_favorites_list', params: {'user_id_param': userId});
    if (response.isNotEmpty) {
      return _getFavoriteListItems(response);
    } else {
      return [];
    }
  }

  List<Item> _getFavoriteListItems(List<dynamic> response) {
    final List<Item> favoriteListItems = [];
    for (int recordeIndex = 0; recordeIndex < response.length; recordeIndex++) {
      final item = response[recordeIndex];
      favoriteListItems.add(Item(
          id: item['item_id'],
          category: item['category_name'],
          background: item['item_color'],
          name: item['item_name'],
          price: item['item_price'] + 0.0,
          image: item['item_image'],
          reviewCount: item['item_review'] + 0.0,
          numberOfPieces: item['item_pieces'],
          stock: item['item_stock']));
    }
    return favoriteListItems;
  }
}
