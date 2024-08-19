import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/order_history/progress_controller.dart';
import 'package:shop/core/my_app_bar.dart';
import 'package:shop/view/widgets/order_history/TimeLineWidget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderNumber = Get.arguments[0];
    final supabase = Supabase.instance.client;
    final stream = supabase
        .from("last_orders")
        .stream(primaryKey: ['order_number'])
        .eq("order_number", orderNumber.toString());
    final ProgressController progressController = Get.put(ProgressController());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(77),
        child: MyAppBar(
          title: Text("Progress"),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Lottie.asset(
                    'assets/animations/ship.json'
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                return const Text("Error loading data");
                } else if (!snapshot.hasData) {
                return const Text("No data available");
                } else {
                final data = snapshot.data![0];
                progressController.updateOrderStatus(data['order_status'], data['is_done']);
            return GetBuilder<ProgressController>(
              builder:(controller) => Column(
                  children: [
                   TimeLineWidget(
                          title: "Progress ⏳",
                          context: context, text: "Your Order Now under Progress",
                          time: "4:25 PM",
                          done: progressController.progress,
                          isFirst: true
                      ),

                    TimeLineWidget(
                          title: "Approved  ✔",
                          context: context,
                          text: "Your Order is Approved",
                          time: "4:30 PM",
                          done: progressController.approve),
                  TimeLineWidget(
                          title: "Delivery it 🚚📦",
                          context: context, text: "Delivery is Coming",
                          time: "4:40 PM",
                          done: progressController.delivery),

                   TimeLineWidget(
                          title: "Done 💥",
                          context: context,
                          text: "Order is done",
                          time: "4:45 PM",
                          done: progressController.done,
                          isLast: true
                      ),

                  ],
              ),
            );}
          }),
        ],
      ),
    );
  }

}
