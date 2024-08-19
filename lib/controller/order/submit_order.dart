import 'package:get/get.dart';

class SubmitController extends GetxController {
  RxBool isLoading = false.obs;
  bool getResponsePage(bool response) {
    isLoading.value = true;
    if(response) {
      return true;
    }
    else {
      return false;
    }
  }
}