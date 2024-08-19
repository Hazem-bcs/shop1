import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyBottomNavigationBarController extends GetxController {

  PageController? pageController = PageController(
    initialPage: 0,
  );

  bool changeFromController = false;
  int _selectedIndex = 0;

  set selectedIndex(int index) {
    _selectedIndex = index;
    pageController?.animateToPage(index,duration: const Duration(milliseconds: 200), curve: Curves.linear);
    update();
  }

  int get selectedIndex => _selectedIndex;
}