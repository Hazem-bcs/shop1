
class NotificationModel {
  int id;
  String title;
  String message;
  String? image;
  String date;

  NotificationModel({required this.id,required this.title,required this.message,
    this.image, required this.date});
}