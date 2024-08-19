import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/core/function/validator.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbodyauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text('Sign Up',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey)),
      ),
      body: PopScope(
        onPopInvoked: (didPop) {
          controller.goToSignIn();
        },canPop: false,child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Welcome Back"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text:
                "Sign Up With Your Email And Password OR Continue With Social Media"),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              keyboardType: TextInputType.name,
              validator: (val) {
                return validator(val: val!, min: 4, max: 50, type: "username");
              },
              myController: controller.username,
              hintText: "Enter Your Username",
              iconData: Icons.person_outline,
              labelText: "Username",
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                return validator(val: val!, min: 4, max: 100, type: "email");
              },
              myController: controller.email,
              hintText: "Enter Your Email",
              iconData: Icons.email_outlined,
              labelText: "Email",
              // mycontroller: ,
            ),
            CustomTextFormAuth(
              keyboardType: TextInputType.phone,
              validator: (val) {
                return validator(val: val!, min: 4, max: 50, type: "phone");
              },
              myController: controller.phone,
              hintText: "Enter Your Phone",
              iconData: Icons.phone_android_outlined,
              labelText: "Phone",
              // mycontroller: ,
            ),
            GetBuilder<SignUpControllerImp>(
              builder: (controller) => CustomTextFormAuth(
                keyboardType: TextInputType.text,
                obscureText: controller.isShowPassword,
                onTap: () {
                  controller.showPassword();
                },
                validator: (val) {
                  return validator(val: val!, min: 5, max: 100,type: "password");
                },
                myController: controller.password,
                hintText: "Enter Your Password",
                iconData: Icons.lock_outline,
                labelText: "Password",
                // mycontroller: ,
              ),
            ),

            CustomButtomAuth(text: "Sign Up", onPressed: () {
              controller.signUp();
            }),
            const SizedBox(height: 40),
            CustomTextSignUpOrSignIn(
              textOne: " have an account ? ",
              textTwo: " SignIn ",
              onTap: () {
                controller.goToSignIn();
              },
            ),
          ]),
        ),
      ),),
    );
  }
}
