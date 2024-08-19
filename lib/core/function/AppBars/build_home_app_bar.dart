import 'package:flutter/material.dart';

import '../../../controller/home/home_controller.dart';
import '../../../view/widgets/order/order_card/carta_widget.dart';
import '../../my_app_bar.dart';

PreferredSize buildHomeAppBar(HomeController homeController) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: MyAppBar(
      color: const Color(0XFF333333),
      actions: [
        CartaWidget(
          key: homeController.cartKey,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileTwo.jpg'),
          ),
        )
      ],
    ),
  );
}
