import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/item.dart';
import '../../model/order_history.dart';

class OrderHistoryData {
  final supabase = Supabase.instance.client;

  Future<List<OrderHistory>> getOrders(int userId) async {
    final response = await supabase.rpc('get_orders', params: {
      'user_id_param': userId,
    });
    return getOrderList(response);
  }

  List<OrderHistory> getOrderList(response) {
    final List<OrderHistory> getOrderList = [];
    for (int itemIndex = 0; itemIndex < response.length; itemIndex++) {
      final DateTime createAt =
          DateTime.parse(response[itemIndex]['created_at']);
      final int orderNumber =
          response[itemIndex]['order_number'] + 0;
      final List<dynamic> getItemList = response[itemIndex]['items'];
      final List<Item> itemList = getItemList.map((item) => Item(
                id: item['item_id'],
                category: item['item_category_name'],
                background: item['item_color'],
                name: item['item_name'],
                price: item['item_price'] + 0.0,
                image: item['item_image'],
                reviewCount: item['item_review'] + 0.0,
                numberOfPieces: item['item_pieces'],
                stock: item['item_stock'],
              )).toList();
      final OrderHistory order =
          OrderHistory(itemList: itemList, createdAt: createAt,orderNumber: orderNumber);
      getOrderList.add(order);
    }
    return getOrderList;
  }
}
