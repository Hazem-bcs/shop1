

import 'package:supabase_flutter/supabase_flutter.dart';

class OrderStatusData {
  final supabase = Supabase.instance.client;

  Future<SupabaseStreamBuilder> getOrders(int orderNumber) async {
    final response = supabase.from("last_orders")
        .stream(primaryKey: ['order_number'])
        .eq("order_number", "12");
    return response;
  }
}