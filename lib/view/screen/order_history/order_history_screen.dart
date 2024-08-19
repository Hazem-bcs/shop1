import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/controller/order_history/order_hiatory_controller.dart';

import '../../widgets/Global_Shimmer/shimmer_screen_widget.dart';

import 'ThereOrderScreen.dart';
import 'no_order_history_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderHistoryController oHCtrl = Get.find();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(
              () =>oHCtrl.isLoading.value ? const ShimmerScreenWidget()
              : oHCtrl.listOrderHistory.isNotEmpty ? const ThereOrderScreen() : const NoOrderHistoryScreen(),
        ));
  }
}
