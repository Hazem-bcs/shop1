import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/view/widgets/Home/home_page/shimmer_reco_widget.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/function/getImageFromDrive.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recommended products",
              style: Theme.of(context).textTheme.bodyLarge,
            )),
        const SizedBox(height: 15),
        Obx(() {
          if (homeController.listRecommendedProducts.isEmpty) {
            return Shimmer.fromColors(
              baseColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              highlightColor: Colors.grey[100]!,
              child: const ShimmerRecommendedWidget(),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: homeController.listRecommendedProducts.length,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) =>
                          homeController.forewordRecommendedProduct(index),
                      animateToClosest: true,
                      autoPlay: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.itemCardScreen, arguments: {
                            'item':
                                homeController.listRecommendedProducts[index],
                            'heroTag': '',
                            'itemId': homeController
                                .listRecommendedProducts[index].id,
                          });
                        },
                        child: Stack(
                          children: [
                            Card(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        getImageFromDrive(homeController
                                            .listRecommendedProducts[index]
                                            .posterImage!),
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<HomeController>(
                  builder: (controller) => Container(
                    width: 48,
                    height: 11,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int index = 0;
                            index <
                                homeController.listRecommendedProducts.length;
                            index++) ...[
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: homeController.indexRecommendedProduct ==
                                        index
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5))),
                            width:
                                homeController.indexRecommendedProduct == index
                                    ? 11
                                    : 7,
                            height:
                                homeController.indexRecommendedProduct == index
                                    ? 11
                                    : 7,
                          )
                        ]
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        })
      ],
    );
  }
}
