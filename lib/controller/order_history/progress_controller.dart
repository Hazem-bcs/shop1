import 'dart:math';

import 'package:get/get.dart';

class ProgressController extends GetxController {
  bool progress = false;
  bool approve = false;
  bool delivery = false;
  bool done = false;
  void updateOrderStatus(String status, bool isDone) {
    progress = false;
    approve = false;
    delivery = false;
    done = false;
    if (status == 'progres') {
      progress = true;
    }
    if (status == 'approv') {
      progress = true;
      approve = true;
      int randomDelay = Random().nextInt(10) + 0;
      Future.delayed(Duration(seconds: randomDelay), () {
        delivery = true;
        update();
      });
    }
    if (isDone) {
      progress = true;
      approve = true;
      delivery = true;
      done = done;
    }
    update();
  }
}
