
import 'item.dart';

class OrderHistory {
  final List<Item> itemList;
  final DateTime createdAt;
  final int orderNumber;

  OrderHistory({required this.itemList, required this.createdAt,required this.orderNumber});
}