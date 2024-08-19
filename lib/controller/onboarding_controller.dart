import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/core/services/services.dart';

import '../core/constant/routes.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  MyServices myServices = Get.find();

  int currentPage = 0;

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onBoarding", "true");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
