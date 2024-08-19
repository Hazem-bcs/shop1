import 'package:get/get.dart';
import 'package:shop/controller/favorite_controller.dart';
import 'package:shop/controller/favorite_list_controller.dart';

import 'controller/cart_controller.dart';
import 'controller/home/search_controller.dart';

import 'controller/order/my_location_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteListController());
    Get.put(CartController());
    Get.put(MyLocationController());
    Get.put(FavoriteController());
    Get.put(MySearchController());
  }
}
