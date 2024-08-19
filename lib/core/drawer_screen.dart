import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shop/core/constant/routes.dart';

import '../view/widgets/list_tile_drawer_widget.dart';

class DrawerMine extends StatelessWidget {
  const DrawerMine({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            child: const Center(
                child:
                    RiveAnimation.asset('assets/animations/shop_drawer.riv')),
          ),
          const SizedBox(height: 20),
          ListTileDrawerWidget(
            onTap: () {
              Get.toNamed(AppRoute.favorite);
            },
            text: 'Favorite',
            icon: 'assets/icons/heartIcon.svg',
          ),
          ListTileDrawerWidget(
            onTap: () {
              Get.toNamed(
                AppRoute.myLocation,
              );
            },
            text: 'My locations',
            icon: 'assets/icons/location.svg',
          ),
          ListTileDrawerWidget(
            onTap: () {
              Get.toNamed(AppRoute.aboutUs);
            },
            text: 'About Us',
            icon: 'assets/icons/about-us.svg',
          ),
          ListTileDrawerWidget(
            onTap: () {
              Get.toNamed(AppRoute.privacy);
            },
            text: 'Privacy Policy',
            icon: 'assets/icons/privacy.svg',
          ),
          Divider(
            height: 40,
            endIndent: size.width * 0.08,
            indent: size.width * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Us",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Call Us: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "+963 941538381",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey[400]),
                    )
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Mail Us: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "support@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey[400]),
                    )
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
