import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../model/item.dart';

class AddToCart {
  final supabase = Supabase.instance.client;

  Future<bool> addToCart(int userId, int itemId) async {
    try {
      await supabase.rpc('check_item_and_add', params: {
        'user_id_input': userId,
        'item_id_input': itemId,
      });
      return true;
    } catch (e) {
      if (e is PostgrestException) {
        if (e.code == '23503') {
          // Handle the foreign key constraint violation error
          return false; // this user is not register yet
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }
  Future<void> removeFromCart(int userId, int itemId) async {
    await supabase.rpc('check_item_and_remove', params: {
      'user_id_input': userId,
      'item_id_input': itemId,
    });
  }
  Future<bool> dropFromCart(int userId, int itemId) async {
    try {
      await supabase.rpc('remove_item', params: {
        'user_id_input': userId,
        'item_id_input': itemId,
      });
      return true;
    } catch (e) {
      if (e is PostgrestException) {
        if (e.code == '23503') {
          return false; // this user is not register yet
        } else {

          return false;
        }
      } else {

        return false;
      }
    }
  }
  Future<List<Item>> getCart(int userId) async {
    try {
      final response = await supabase.rpc("get_cart_items" , params: { 'user_id' : userId});
      return getItems(response);
    } catch (e) {
      if (e is PostgrestException) {
        if (e.code == '23503') {
          return []; // this user is not register yet
        } else {

          return [];
        }
      } else {

        return [];
      }
    }
  }
  Future<bool> submitOrder(int userId) async {
    final transferData = await supabase.rpc("transfer_data" , params: { 'user_id_input' : userId});
    final deleteCarta = await supabase.rpc("delete_carta" , params: { 'user_id_input' : userId});
    return transferData && deleteCarta;
  }
  List<Item> getItems(response) {
    final List<Item> listItems = [];
    for(int index=0; index<response.length; index++) {
      final item = response[index];
      listItems.add(Item(
        id: item['item_id'] +0,
        category: item['category_name'],
        background: item['item_color'],
        name: item['item_name'],
        price: item['item_price'] + 0.0,
        image: item['item_image'],
        reviewCount: item['item_review'] + 0.0,
        numberOfPieces: item['amount']+0,
        stock: item['item_stock']+0,
      ));
    }
    return listItems;
  }
}