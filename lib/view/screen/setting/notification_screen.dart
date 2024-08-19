import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/controller/notification_controller.dart';
import 'package:shop/core/my_app_bar.dart';

import '../../widgets/Global_Shimmer/shimmer_screen_widget.dart';
import '../../widgets/Home/notification/listtile_notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.put(NotificationController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 25),
          Text(
            "Notifications",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Expanded(
            child: Obx(() {
              if (notificationController.isLoading.value == true) {
                return const ShimmerScreenWidget();
              }
              else {
                return GetBuilder<NotificationController>(
                  builder: (controller) => ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      endIndent: size.width * 0.08,
                      indent: size.width * 0.08,
                      color: Colors.grey[400],
                    ),
                    itemCount: notificationController.notificationsList.length + 2, // for First and Last SizedBox
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SizedBox(height: 20);
                      } else if (index == notificationController.notificationsList.length+1) {
                        return const SizedBox(height: 70);
                      } else {
                        return Slidable(
                            endActionPane: ActionPane(
                                extentRatio: .25,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                      onPressed: (context) {
                                        notificationController.removeElement(index-1);
                                      },
                                      icon: Icons.delete,
                                      backgroundColor: Colors.redAccent)
                                ]),
                            child: ListTileNotificationWidget(size: size,
                              notificationModel: notificationController.notificationsList[index-1],));
                      }
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  MyAppBar buildMyAppBar(BuildContext context) {
    return MyAppBar(
          title: Text(
            "Notifications",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        );
  }
}