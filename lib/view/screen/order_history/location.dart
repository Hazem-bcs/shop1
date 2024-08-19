import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/controller/cart_controller.dart';
import 'package:shop/core/function/my_snack_bar.dart';
import 'package:shop/view/widgets/order/location/set_your_location_widget.dart';

import '../../../controller/order/my_location_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/location.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final MyLocationController locationController = Get.find();
    locationController.updateIsLoadingSubmit(false);
    return GetBuilder<MyLocationController>(
        builder: (controller) => locationController.isLoadingSubmit
            ? const Scaffold(
                body: Center(
                  child: SizedBox(
                    height: 280,
                    width: 300,
                    child:
                        RiveAnimation.asset('assets/animations/delivery.riv'),
                  ),
                ),
              )
            : Scaffold(
                floatingActionButtonAnimator:
                    FloatingActionButtonAnimator.scaling,
                floatingActionButton: buildFloatingActionButton(
                    locationController, cartController),
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child:
                                  Lottie.asset('assets/animations/ship.json'),
                            ),
                          ),
                        ), // animation
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.sizeOf(context).width * 0.12,
                              vertical: 20),
                          child: const SetYourLocationWidget(),
                        ), // location button
                        const SizedBox(height: 40),
                        GetBuilder<MyLocationController>(
                          builder: (controller) {
                            MyLocation location =
                                locationController.selectedLocation;
                            return Card(
                              child: ListTile(
                                trailing: Lottie.asset(
                                    'assets/animations/jps_select.json'),
                                title: Text(location.title),
                                subtitle: Text(location.location),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }

  FloatingActionButton buildFloatingActionButton(
      MyLocationController locationController, CartController cartController) {
    return FloatingActionButton(
      onPressed: () async {
        if (locationController.myLocationsList.isEmpty) {
          mySnackBar("Pleas select your location first");
        } else {
          locationController.updateIsLoadingSubmit(true);
          bool submitSuccess = await cartController.getSubmitOrder(1);
          await Future.delayed(const Duration(seconds: 2));
          if (submitSuccess) {
            Get.offAllNamed(AppRoute.thxForOrder);
          } else {
            Get.toNamed(AppRoute.errorScreen);
          }
        }
      },
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
