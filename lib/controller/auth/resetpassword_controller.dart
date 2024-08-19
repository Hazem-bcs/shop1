import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
  showPassword();
  showRePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController rePassword;
  bool isShowPassword = true;
  bool isShowRePassword = true;

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() {
    if (formState.currentState!.validate()) {
      Get.offNamed(AppRoute.successResetPassword);
    } else {
    }
  }

  @override
  showPassword() {
    isShowPassword == false ? isShowPassword = true : isShowPassword = false;
    update();
  }

  @override
  showRePassword() {
    isShowRePassword == false ? isShowRePassword = true : isShowRePassword = false;
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
