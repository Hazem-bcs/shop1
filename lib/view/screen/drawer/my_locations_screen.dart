import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shop/core/function/AppBars/build_my_locations_app_bar.dart';

import '../../../controller/order/my_location_controller.dart';

import '../../setting/LocationCardWidget.dart';
import '../../widgets/order_history/add_location_widget.dart';

class MyLocationsScreen extends StatelessWidget {
  const MyLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: buildMyLocationAppBar(context)),
      body: GetBuilder<MyLocationController>(
        builder: (controller) => AnimatedList(
          key: controller.listKey,
          initialItemCount: controller.myLocationsList.length + 2,
          itemBuilder: (context, index, animation) {
            // for First and Last SizedBox
            if (index == 0 || index == controller.myLocationsList.length + 1) {
              return const SizedBox(height: 15);
            } else {
              final int realIndex = index - 1; // that's cuz first Element
              return Slidable(
                  key: ValueKey(
                      controller.myLocationsList[realIndex].locationId),
                  endActionPane: ActionPane(
                      extentRatio: .25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                            onPressed: (context) {
                              controller.removeElement(realIndex);
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.redAccent), // for remove
                        SlidableAction(
                            onPressed: (context) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AddLocations(
                                    isUpdateMode: true,
                                    index: realIndex,
                                  );
                                },
                              );
                            },
                            icon: Icons.edit,
                            backgroundColor: Colors.grey), // for Edit
                      ]),
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: LocationCardWidget(
                      size: size,
                      title: controller.myLocationsList[realIndex].title,
                      subTitle: controller.myLocationsList[realIndex].location,
                      numberInList: (realIndex + 1).toString(),
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}
