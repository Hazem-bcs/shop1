import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddMoreThingsButtonWidget extends StatelessWidget {
  const AddMoreThingsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 190,
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 20),
          height: 45,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(
                  Radius.circular(13))),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/back.svg',
                width: 20,
                height: 20,
                color: const Color.fromARGB(255, 6, 2, 67),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Add more things',
                style: TextStyle(
                  color: Color.fromARGB(255, 6, 2, 67),
                ),
              ),
            ],
          ),
        ));
  }
}