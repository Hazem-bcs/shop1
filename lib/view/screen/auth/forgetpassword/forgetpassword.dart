import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/function/validator.dart';

import '../../../../controller/auth/forgetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widgets/auth/custombuttonauth.dart';
import '../../../widgets/auth/customtextbodyauth.dart';
import '../../../widgets/auth/customtextformauth.dart';
import '../../../widgets/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text('14'.tr,
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
            CustomTextTitleAuth(text: "27".tr),
            const SizedBox(height: 10),
            CustomTextBodyAuth(
                // please Enter Your Email Address To Receive A verification code
                text: "29".tr),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                return validator(val: val!, min: 5, max: 50, type: "email");
              },
              hintText: "12".tr,
              myController: controller.email,
              iconData: Icons.email_outlined,
              labelText: "18".tr,
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "30".tr,
                onPressed: () {
                  controller.goToVerifyCode();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),
    );
  }
}
