import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("onBoarding") == "true") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}