import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/view/widgets/Global_Shimmer/shimmer_item_widget.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constant/routes.dart';
import '../../item_widget.dart';
import '../horizintal_list_view_widget.dart';
import '../text_home_widget.dart';

class MostPopularCategory extends StatelessWidget {
  const MostPopularCategory({
    super.key, required this.controller, required this.listClick,
  });
  final void Function(GlobalKey<State<StatefulWidget>>) listClick;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetTextHome(title: "Most Popular",
          onPressedOnViewAll: () { Get.toNamed(AppRoute.viewAll, arguments: controller.listMostPopular); },
        ),
        const SizedBox(height: 30),
        Obx(() {
          if(controller.listMostPopular.isEmpty) {
            return Shimmer.fromColors(
              baseColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              highlightColor: Colors.grey[100]!,
              child: const ShimmerItemWidget(),
            );
          }
          else {
            return WidgetHorizontalListView(itemCount: controller.listMostPopular.length,
                itemBuilder: (_, index) {
                  final String heroTag = "mostPopular${controller.listMostPopular[index].id}";
                  return ItemWidget(item: controller.listMostPopular[index],heroTag:heroTag,
                    index: index,onClick: listClick,);
                },
                height: 290);
          }
        })
      ],
    );
  }
}