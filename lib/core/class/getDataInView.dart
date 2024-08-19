import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetData extends StatelessWidget {
  const GetData({super.key, required this.condition, required this.child});
  final bool condition;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => condition
          ? const Center(child: CircularProgressIndicator())
          : child
    );
  }
}
