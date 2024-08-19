import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shop/view/widgets/add_to_cart_animation_widget.dart';

import '../../../controller/favorite_list_controller.dart';
import '../../../controller/order_history/order_hiatory_controller.dart';
import '../../../core/bottom_navigation_bar.dart';
import '../../../core/drawer_screen.dart';
import '../../../core/function/AppBars/build_home_app_bar.dart';

import 'category_screen.dart';
import '../setting/notification_screen.dart';
import 'home_page.dart';
import '../order_history/order_history_screen.dart';

import '../../../controller/home/home_controller.dart';
import '../../../controller/my_bottom_navigation_bar_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteListController());
    Get.put(MyBottomNavigationBarController());
    Get.put(OrderHistoryController());
    final MyBottomNavigationBarController myBottomController = Get.find();
    final HomeController homeController = Get.put(HomeController());
    return AddToCartAnimationWidget(
      controller: homeController,
      dontRepeat: false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildHomeAppBar(homeController),
          drawer: const DrawerMine(),
          body: Stack(
            children: [
              GetBuilder<MyBottomNavigationBarController>(
                builder: (controller) => PageView(
                  onPageChanged: (index) {
                    if (!myBottomController.changeFromController) {
                      myBottomController.selectedIndex = index;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        myBottomController.changeFromController = false;
                      });
                    }
                  },
                  controller: myBottomController.pageController,
                  children: [
                    HomePage(
                      controller: homeController,
                      listClick: homeController.runAddToCartAnimation,
                    ),
                    CategoryScreen(),
                    const OrderHistoryScreen(),
                    const NotificationScreen()
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: MediaQuery.of(context).size.width * 0.1,
                child: MyBottomNavigationBar(),
              ),
            ],
          )),
    );
  }

  void listClick(GlobalKey widgetKey) async {
    HomeController homeController = Get.find();
    await homeController.runAddToCartAnimation(widgetKey);
  }
}
