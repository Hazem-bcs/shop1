import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/my_bottom_navigation_bar_controller.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  final MyBottomNavigationBarController _controller =
      Get.put(MyBottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: GetBuilder<MyBottomNavigationBarController>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                _controller.changeFromController = true;
                _controller.selectedIndex = 0;
              },
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                color: _controller.selectedIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              )),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              _controller.changeFromController = true;
              _controller.selectedIndex = 1;
            },
            icon: SvgPicture.asset(
              'assets/icons/category.svg',
              height: 28,
              width: 28,
              color: _controller.selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              _controller.changeFromController = true;
              _controller.selectedIndex = 2;
            },
            icon: SvgPicture.asset(
              'assets/icons/order_history.svg',
              height: 28,
              width: 28,
              color: _controller.selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              _controller.changeFromController = true;
              _controller.selectedIndex = 3;
            },
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              height: 30,
              width: 30,
              color: _controller.selectedIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          )
        ]),
      ),
    );
  }
}
