import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/notification_model/notification_model.dart';

class NotificationRepository {
  final ApiClient client;

  NotificationRepository({required this.client});

  Future<List<NotificationModel>> fetchNotification() async {
    final rawNotification = await client.fetchNotification();
    final notifi =
        rawNotification.map((e) => NotificationModel.fromJson(e)).toList();
    return notifi;
  }
}
