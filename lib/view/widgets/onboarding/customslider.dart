import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => Column(
              children: [
                Image.asset(
                  onBoardingList[index].image!,
                  // width: double.infinity,
                  height: 230,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Text(onBoardingList[index].title!,
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(height: 20),
          
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[index].body!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ));
  }
}
