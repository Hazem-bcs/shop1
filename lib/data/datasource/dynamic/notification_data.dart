import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/notification.dart';


class NotificationData {
  final supabase = Supabase.instance.client;

  void deleteNotification(int userId, notificationId) async {
    await supabase.rpc('delete_notification', params: {
      'user_id_input': userId,
      'notification_id_input':notificationId
    });
  }
  Future<List<NotificationModel>> getNotifications(int userId) async {
    final response = await supabase.rpc('get_user_notifications', params: {
      'user_id_input': userId,
    });
    return getNotificationsList(response);
  }
  List<NotificationModel> getNotificationsList(dynamic response) {
    if (response is! List<dynamic>) {
      throw Exception('Expected a list of notifications');
    }
    
    final listNotification = response.cast<Map<String, dynamic>>().map((e) {
      return NotificationModel(
        id: e['notification_id'],
        title: e['title'],
        message: e['message'],
        image: e['image'],
        date: timeAgo(DateTime.parse(e['created_at'])),
      );
    }).toList();

    return listNotification;
  }
  String timeAgo(DateTime date) {
    Duration diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} h ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} min ago';
    } else {
      return 'Just now';
    }
  }
}