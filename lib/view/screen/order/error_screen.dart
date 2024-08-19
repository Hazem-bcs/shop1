import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/controller/order/my_location_controller.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final MyLocationController locationController = Get.find();
    locationController.updateIsLoadingSubmit(false);
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:  Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.55),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text("Error",style: Theme.of(context).textTheme.displayMedium,),
                    const SizedBox(height: 20),
                    Text("Some thing happened 😕",style: Theme.of(context).textTheme.bodyLarge),
                    Text("your order doesn't placed",style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 80),
                    MaterialButton(color: Theme.of(context).colorScheme.primary,onPressed: () {
                      Get.back();
                    }, child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 9.0),
                      child: Text("Try again",style: Theme.of(context).textTheme.displaySmall,),
                    ),)


                  ],
                ),
              ),
            ),
            Positioned(top: MediaQuery.of(context).size.height * 0.1 ,left: (MediaQuery.of(context).size.width * 0.01),
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.width * 0.7,
                child: const RiveAnimation.asset("assets/animations/erorr.riv",
                  fit: BoxFit.cover,),
              ),),

          ],
        ),
      ),
    );
  }
}
