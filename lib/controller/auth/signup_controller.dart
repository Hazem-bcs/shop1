
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';


abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isShowPassword = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  signUp() {
    if(formState.currentState!.validate()) {

      // Get.toNamed(AppRoute.verifyCodeSingUp);
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  showPassword() {
    isShowPassword == false ? isShowPassword = true : isShowPassword = false;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController() ; 
    phone = TextEditingController() ; 
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
