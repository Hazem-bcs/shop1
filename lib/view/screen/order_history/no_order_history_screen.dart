import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/controller/my_bottom_navigation_bar_controller.dart';

import '../../widgets/order_history/history_text_widget.dart';
import '../../widgets/sliver_sized_box.dart';

class NoOrderHistoryScreen extends StatelessWidget {
  const NoOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyBottomNavigationBarController myBottomController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          const SliverSizedBox(height: 25),
          const HistoryTextWidget(),
          const SizedBox(height: 50),
          const SizedBox(
            width: 250,
            height: 250,
            child: RiveAnimation.asset('assets/animations/no_order2.riv'),
          ),
          Center(
            child: Text(
              "No History Yet",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
              child: Text("you didn't take order yet go to order",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white70))),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  myBottomController.selectedIndex = 1;
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.4))),
                child: const Text(
                  "Start Ordering",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
