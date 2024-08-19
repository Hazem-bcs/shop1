import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/view/widgets/order/carta/item_cart_widget.dart';

import '../core/function/get_total_price.dart';
import '../core/function/my_snack_bar.dart';
import '../data/datasource/dynamic/cart/add_to_cart.dart';
import '../data/model/item.dart';

class CartController extends GetxController {
  final AddToCart _repository = AddToCart();
  final RxBool isLoading = true.obs;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Item> cartList = [];
  double totalPrice = 0;

  void remove(Item item) {
    if (item.numberOfPieces > 0) {
      item.numberOfPieces--;
      _repository.removeFromCart(1, item.id);
      totalPrice -= item.price;
      if (item.numberOfPieces == 0) {
        drop(item.id);
      }
      update();
    } else {
      mySnackBar("you cant order Minus pieces");
    }
  }

  void drop(int itemId) {
    _repository.dropFromCart(1, itemId);
    int removedItemIndex = 0;
    Item removedItem;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == itemId) {
        removedItemIndex = i;
        break;
      }
    }
    if (cartList.isNotEmpty) {
      removedItem = cartList[removedItemIndex];
      listKey.currentState?.removeItem(
        removedItemIndex + 1,
        (context, animation) => buildRemovedItem(
            removedItemIndex + 1, context, animation, removedItem),
      );
    }
    cartList.removeWhere((item) => item.id == itemId);
    update();
  }

  Widget buildRemovedItem(int index, BuildContext context,
      Animation<double> animation, Item removedItem) {
    return SizeTransition(
      sizeFactor: animation,
      child: ItemCartWidget(
        withSizedBox: true,
        item: removedItem,
      ),
    );
  } // this for Animation remove Widget

  bool add(Item item) {
    if (item.numberOfPieces < item.stock) {
      item.numberOfPieces++;
      _repository.addToCart(1, item.id);
      totalPrice += item.price;
      update();
      return true;
    } else {
      mySnackBar("out of stock");
      return false;
    }
  }

  Future<bool> getSubmitOrder(int userId) async {
    bool result = await _repository.submitOrder(1);
    return result;
  }

  Future<void> getListCart() async {
    try {
      isLoading.value = true;
      final categoryList = await _repository.getCart(1);
      cartList.assignAll(categoryList);
      totalPrice = getTotalPrice(cartList);
    } finally {
      isLoading.value = false;
    }
  }
}
