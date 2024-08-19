import 'package:get/get.dart';

import '../data/datasource/dynamic/notification_data.dart';
import '../data/model/notification.dart';


class NotificationController extends GetxController {
  final NotificationData _repository = NotificationData();
  final RxBool isLoading = true.obs;
  List<NotificationModel> notificationsList = [];
  Future<void> getListCart() async {
    try {
      isLoading.value = true;
      final notificationsListRepo = await _repository.getNotifications(1);
      notificationsList.assignAll(notificationsListRepo);
    } finally {
      isLoading.value = false;
    }
  }
  void removeElement(int index) {
    deleteNotificationFromDataBase(notificationsList[index].id);
    notificationsList.removeAt(index);
    update();
  }
  @override
  void onInit() {
    getListCart();
    super.onInit();
  }

  void deleteNotificationFromDataBase(int notificationId) {
    _repository.deleteNotification(1, notificationId);
  }
}