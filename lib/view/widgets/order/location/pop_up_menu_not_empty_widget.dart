import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/order/my_location_controller.dart';

class PopUpMenuNotEmptyWidget extends StatelessWidget {
  const PopUpMenuNotEmptyWidget({
    super.key,
    required this.size,
    required this.index,
  });
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final MyLocationController locationController = Get.find();
    return SizedBox(
      width: size.width * 0.7,
      child: ListTile(
        contentPadding:
        EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.069),
        title: Text(locationController.myLocationsList[index].title),
        subtitle:
        Text(locationController.myLocationsList[index].location,maxLines: 1,
          softWrap: true,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(
          radius: 25,
          child: Text(
            "$index",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}