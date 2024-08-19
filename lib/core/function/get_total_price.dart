
import '../../data/model/item.dart';

double getTotalPrice(List<Item> list) {
  double totalPrice = 0;
  for (int i = 0; i < list.length; i++) {
    totalPrice += list[i].price * list[i].numberOfPieces;
  }
  return totalPrice;
}
