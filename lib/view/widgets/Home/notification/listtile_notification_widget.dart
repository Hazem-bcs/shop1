import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/notification.dart';

class ListTileNotificationWidget extends StatelessWidget {
  const ListTileNotificationWidget({
    super.key,
    required this.size, required this.notificationModel,
  });
  final NotificationModel notificationModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: size.width * 0.089),
      isThreeLine: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(notificationModel.title),
          Text(
            notificationModel.date,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
      subtitle: Text(
        notificationModel.message,
        style: Theme.of(context).textTheme.bodySmall,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: notificationModel.image == null
            ? const AssetImage("assets/images/profile.png") as ImageProvider<Object>
            : CachedNetworkImageProvider(notificationModel.image!),
      ),
    );
  }
}