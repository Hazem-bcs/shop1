import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/function/alertExitApp.dart';
import 'package:shop/core/function/validator.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/color.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customtextbodyauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtexttitleauth.dart';
import '../../widgets/auth/logoauth.dart';
import '../../widgets/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColor.grey)),
      ),
      body: PopScope(
        onPopInvoked: alertExitApp,canPop: false,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(children: [
              const LogoAuth(),
              const SizedBox(height: 20),
              const CustomTextTitleAuth(text: "Welcome Back"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(
                  text:
                  "Sign In With Your Email And Password OR Continue With Social Media"),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  return validator(val: val!, min: 5, max: 100,type: "email");
                },
                myController: controller.email,
                hintText: "Enter Your Email",
                iconData: Icons.email_outlined,
                labelText: "Email",
                // mycontroller: ,
              ),
              GetBuilder<LoginControllerImp>(
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
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: const Text(
                  "Forget Password",
                  textAlign: TextAlign.end,
                ),
              ),
              CustomButtomAuth(text: "Sign In", onPressed: () {
                controller.login();
              }),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textOne: "Don't have an account ? ",
                textTwo: "SignUp",
                onTap: () {
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      ),

    );
  }
}
