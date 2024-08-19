import 'package:flutter/material.dart';
import 'package:get/get.dart';


void mySnackBar(String title) {
  Get.showSnackbar(
      GetSnackBar(
        messageText: Text(title,
          style: const TextStyle(color: Colors.redAccent),),
        duration: const Duration(seconds: 2),
      ));
}