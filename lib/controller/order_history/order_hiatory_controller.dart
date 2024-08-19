import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop/core/function/get_total_price.dart';
import 'package:shop/data/model/order_history.dart';

import '../../data/datasource/dynamic/order_history_data.dart';
import '../../data/model/item.dart';


class OrderHistoryController extends GetxController {
  final OrderHistoryData _repository = OrderHistoryData();
  final RxBool isLoading = true.obs;
  RxList<OrderHistory> listOrderHistory = RxList<OrderHistory>();
  Future<void> getCategoryData(int userId) async {
    try {
      isLoading.value = true;
      final categoryList = await _repository.getOrders(userId);
      listOrderHistory.assignAll(categoryList);
    } finally {
      isLoading.value = false;
    }
  }
  String getOrderText(List<Item> list) {
    List<String> itemNames = list.map((item) => item.name).toList();
    String combinedText = itemNames.join(', ');
    return combinedText;
  }
  String getOrderPrice(List<Item> items) {
    double totalPrice = getTotalPrice(items);
    String formattedPrice = totalPrice.toStringAsFixed(2); // Use toStringAsFixed()
    return formattedPrice;
  }

  String formatDateTime(DateTime dateTime) {
    DateFormat formatter = DateFormat('M/d/yyyy h:mm a');
    return formatter.format(dateTime);
  }

  Map<String, List<String>> getMapList(List<Item> items) {
    Map<String, List<String>> map;
    List<String> imageList = [];
    imageList = items.map((item) => item.image).toList();
    List<String> imageListWithoutDuplicates = imageList.toSet().toList();
    List<String> colorList = [];
    colorList = items.map((item) => item.background).toList();
    colorList = noRepeat(imageList,imageList.toSet().toList(),colorList); // to no repeat images in Order History
    map = {
      "imageList" : imageListWithoutDuplicates,
      "colorList" : colorList
    };
    return map;
  }
  @override
  void onInit() {
    super.onInit();
    getCategoryData(1);
  }

  List<String> noRepeat(List<String> firstList,List<String> fistListWithOutDuplicates, List<String> secondeList) {
    List<String> newSecList = [];
    for (int i = 0; i < firstList.length; i++) {
      if (fistListWithOutDuplicates.contains(firstList[i])) {
        fistListWithOutDuplicates.remove(firstList[i]);
        newSecList.add(secondeList[i]);
      }
    }
    return newSecList;
  }
}