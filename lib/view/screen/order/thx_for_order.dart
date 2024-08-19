import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/core/constant/routes.dart';

class ThxForOrder extends StatelessWidget {
  const ThxForOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: const RiveAnimation.asset(
                      "assets/animations/good.riv",
                    ),
                  ),
                  Text(
                    "Thank You",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  Text("For order from us your",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("order Id is 104421",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Positioned(
                bottom: 70,
                left: (MediaQuery.of(context).size.width * 0.5) - 150,
                child: Column(
                  children: [
                    Text("To track your order go to ",
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        Get.offAllNamed(AppRoute.home);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 9.0),
                        child: Text(
                          "Home",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
