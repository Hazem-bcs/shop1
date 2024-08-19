import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alertExitApp(bool didPop) {
  Get.defaultDialog(title: "Attention",
      middleText: "Do you want to leave?",
      actions: [
        ElevatedButton(onPressed: () {
          exit(0);
        }, child: const Text("Confirm")),
        ElevatedButton(onPressed: () {
          Get.back();
        }, child: const Text("Cancel"))
      ]
  );
}