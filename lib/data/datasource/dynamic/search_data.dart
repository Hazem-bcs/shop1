import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/item.dart';

class SearchData {
  final supabase = Supabase.instance.client;

  Future<List<Item>> getListFavoriteItem(String text) async {
    final response = await supabase
        .rpc('search_product_name', params: {'search_text': text});
    if (response.isNotEmpty) {
      return _getSearchListItems(response);
    } else {
      return [];
    }
  }

  List<Item> _getSearchListItems(List<dynamic> response) {
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
