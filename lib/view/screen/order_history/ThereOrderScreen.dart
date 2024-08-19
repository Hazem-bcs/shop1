import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/core/constant/routes.dart';
import 'package:shop/view/widgets/sliver_sized_box.dart';

import '../../../controller/order_history/order_hiatory_controller.dart';
import '../../../data/model/order_history.dart';
import '../../widgets/order_button_card_widget.dart';
import '../../widgets/order_history/history_text_widget.dart';
import '../../widgets/order_history/image_history_row_widget.dart';

class ThereOrderScreen extends StatelessWidget {
  const ThereOrderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OrderHistoryController oHCtrl = Get.find();
    return CustomScrollView(
      slivers: [
        const SliverSizedBox(height: 25),
        const HistoryTextWidget(),
        SliverList.separated(
          itemBuilder: (context, index) {
            final OrderHistory currentOrder = oHCtrl.listOrderHistory[index];
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 3)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageHistoryRowWidget(
                        mapList: oHCtrl.getMapList(currentOrder.itemList),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              oHCtrl.getOrderText(currentOrder.itemList),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            oHCtrl.formatDateTime(currentOrder.createdAt),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "\$${oHCtrl.getOrderPrice(currentOrder.itemList)}",
                            style: const TextStyle(
                              color: Color(0XFFF4C750),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: OrderButtonCardWidget(
                        onPressed: () {
                          Get.toNamed(AppRoute.progressScreen,
                              arguments: [currentOrder.orderNumber]);
                        },
                        border: true,
                        child: Text("Progressing",
                            style: Theme.of(context).textTheme.labelMedium),
                      )),
                      const SizedBox(width: 30),
                      Expanded(
                          child: OrderButtonCardWidget(
                        onPressed: () {
                          Get.toNamed(AppRoute.detailsScreen,
                              arguments: [currentOrder.itemList]);
                        },
                        colorInBackGround: true,
                        child: Text("Details",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ))
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: oHCtrl.listOrderHistory.length,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        )
      ],
    );
  }
}
