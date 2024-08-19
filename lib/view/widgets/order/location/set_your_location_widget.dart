import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/view/widgets/order/location/pop_up_menu_empty_widget.dart';
import 'package:shop/view/widgets/order/location/pop_up_menu_not_empty_widget.dart';

import '../../../../controller/order/my_location_controller.dart';
import '../../order_history/add_location_widget.dart';

class SetYourLocationWidget extends StatelessWidget {
  const SetYourLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MyLocationController locationController = Get.find();
    return ElevatedButton(
        onPressed: () {
          final size = MediaQuery.sizeOf(context);
          showMenu(
              context: context,
              position: RelativeRect.fromDirectional(
                  textDirection: TextDirection.ltr,
                  start: size.width * 0.12,
                  top: size.height * 0.5,
                  end: 200,
                  bottom: 200),
              items: [
                if (locationController.myLocationsList.isEmpty) ...[
                  PopupMenuItem(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddLocations();
                          },
                        );
                      },
                      mouseCursor: WidgetStateMouseCursor.clickable,
                      padding: const EdgeInsets.all(12.0),
                      child: const PopUpMenuEmptyWidget())
                ],
                for (int index = 0;
                    index < locationController.myLocationsList.length;
                    index++) ...[
                  PopupMenuItem(
                      onTap: () {
                        locationController.setSelectedLocation(
                            locationController.myLocationsList[index]);
                      },
                      child: PopUpMenuNotEmptyWidget(size: size, index: index))
                ]
              ]);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Select your Location"),
        ));
  }
}
