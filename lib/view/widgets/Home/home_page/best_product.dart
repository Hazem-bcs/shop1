import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/view/widgets/Global_Shimmer/shimmer_item_widget.dart';

import '../../../../controller/home/home_controller.dart';
import '../../item_widget.dart';
import '../horizintal_list_view_widget.dart';
import '../text_home_widget.dart';

class BestProductSection extends StatelessWidget {
  const BestProductSection({
    super.key, required this.controller,required this.listClick
  });
  final void Function(GlobalKey<State<StatefulWidget>>) listClick;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetTextHome(
          title: "Best Products",
          onPressedOnViewAll: () { Get.toNamed(AppRoute.viewAll, arguments: controller.listBestItems); },
        ),
        const SizedBox(height: 30),
        Obx(() {
          if(controller.listBestItems.isEmpty) {
            return Shimmer.fromColors(
              baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              highlightColor: Colors.grey[100]!,
              child: const ShimmerItemWidget(),
            );
          }
          else {
            return WidgetHorizontalListView(itemCount: controller.listBestItems.length,
                itemBuilder: (_, index) {
                  final String heroTag = "bestProduct${controller.listBestItems[index].id}";
                  return ItemWidget(item: controller.listBestItems[index],heroTag:heroTag,
                  index: index,onClick: listClick,);
                },
                height: 290);
          }
        })
      ],
    );
  }
}

