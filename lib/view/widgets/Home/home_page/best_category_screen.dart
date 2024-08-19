import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/view/widgets/Home/home_page/shimmer_category_widget.dart';

import '../../../../controller/home/home_controller.dart';

import '../category_home_widget.dart';
import '../clip_path.dart';
import '../horizintal_list_view_widget.dart';
import '../search_text.dart';
import '../text_home_widget.dart';
import 'blur_circle_widget.dart';

class BestCategorySection extends StatelessWidget {
  const BestCategorySection({
    super.key,
    required HomeController controller,
  }) : homeController = controller;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color primaryColorWithOpacity = Theme.of(context).colorScheme.primary.withOpacity(0.3);
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        color: const Color(0xff333333),
        child: Stack(
          children: [
            BlurCircleWidget(
                width: 200,
                height: 200,
                left: -150,
                borderColor: primaryColor),
            BlurCircleWidget(
                width: 250,
                height: 150,
                right: -200,
                top: 50,
                borderColor: primaryColor),
            BlurCircleWidget(
              width: 80,
              height: 80,
              right: 180,
              top: 70,
              color: primaryColorWithOpacity,
              borderColor:
              primaryColorWithOpacity,
            ),
            BlurCircleWidget(
              width: 30,
              height: 30,
              left: 50,
              bottom: 30,
              color: primaryColorWithOpacity,
              borderColor:
              primaryColorWithOpacity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: const SizedBox(
                width: double.infinity,
                height: 300,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const SearchTextFieldMine(
                    hintText: "Search in the shop",
                  ),
                  const WidgetTextHome(
                    title: "Popular Category",
                    showAll: false,
                  ), // Text Row
                  const SizedBox(height: 30),
                  Obx(
                    () {
                      if (homeController.listBestCategories.isEmpty) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.5),
                          highlightColor: Colors.grey[100]!,
                          child: const ShimmerCategoryHomePageWidget(),
                        );
                      } else {
                        return WidgetHorizontalListView(
                          height: 95,
                          itemCount: homeController.listBestCategories.length,
                          itemBuilder: (_, index) => CategoryHomeWidget(
                            category: homeController.listBestCategories[index],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}