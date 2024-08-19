import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/item.dart';

class ViewAllController extends GetxController {
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late final Function(GlobalKey) runAddToCartAnimation;
  final RxList<Item> listBestItems = RxList<Item>();
}