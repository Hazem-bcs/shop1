
class OrderStatusModel {
  final int orderNumber;
  final String status; // 'accepted', 'rejected', 'processing'

  OrderStatusModel({required this.orderNumber, required this.status});
}
