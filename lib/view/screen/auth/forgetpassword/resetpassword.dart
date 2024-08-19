import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/function/validator.dart';

import '../../../../controller/auth/resetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtextformauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "35".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(text: "35".tr),
            const SizedBox(height: 15),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                obscureText: controller.isShowPassword,
                onTap: () {
                  controller.showPassword();
                  },
                keyboardType: TextInputType.text,
                validator: (val) {
                  return validator(val: val!,min: 3,max: 40,type: "password");
                },
                myController: controller.password,
                hintText: "13".tr,
                iconData: Icons.lock_outline,
                labelText: "19".tr,
                // mycontroller: ,
              ),
            ),
            GetBuilder<ResetPasswordControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                keyboardType: TextInputType.text,
                obscureText: controller.isShowRePassword,
                onTap: () {
                  controller.showRePassword();
                },
                validator: (val) {
                  return validator(val: val!,min: 3,max: 40,type: "rePassword",rePasswordValue: controller.password.value.text);
                },
                myController: controller.rePassword,
                hintText: "Re ${"13".tr}",
                iconData: Icons.lock_outline,
                labelText: "19".tr,
                // mycontroller: ,
              ),
            ),
            CustomButtomAuth(
                text: "33".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
