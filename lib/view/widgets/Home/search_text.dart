import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/controller/home/home_controller.dart';
import 'package:shop/controller/home/search_controller.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/core/function/my_snack_bar.dart';

class SearchTextFieldMine extends StatelessWidget {
  const SearchTextFieldMine({
    super.key,
    this.hintText,
  });
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final MySearchController searchController = Get.find();
    return Stack(
      children: [
        Positioned(
            right: 20,
            top: -25,
            child: SizedBox(
              width: 200,
              height: 70,
              child: GetBuilder<HomeController>(
                builder: (controller) => RiveAnimation.asset(
                  "assets/animations/pub.riv",
                  onInit: homeController.onRiveInit,
                ),
              ),
            )),
        Column(
          children: [
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      onTap: () {
                        homeController.makeItTrue();
                      },
                      onSubmitted: (text) {
                        if (searchController.checkIsShort(text)) {
                          mySnackBar(
                              "you search text so short pleas make it longer");
                        } else {
                          searchController.searchOnData(text);
                          Get.toNamed(AppRoute.searchScreen);
                        }
                        homeController.makeItFalse();
                      },
                      onChanged: (text) {
                        if (!searchController.checkIsShort(text)) {
                          searchController.searchOnData(text);
                        }
                      },
                      controller: homeController.textFieldController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final String text =
                        homeController.textFieldController.value.text;
                    if (searchController.checkIsShort(text)) {
                      mySnackBar(
                          "you search text so short pleas make it longer");
                    } else {
                      searchController.searchOnData(text);
                      Get.toNamed(AppRoute.searchScreen);
                    }
                    FocusScope.of(context).unfocus();
                    homeController.makeItFalse();
                  },
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: RiveAnimation.asset(
                        "assets/animations/search_icon.riv"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}
