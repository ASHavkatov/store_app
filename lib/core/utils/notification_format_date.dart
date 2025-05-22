import '../../data/models/notification_model/notification_model.dart';

Map<String, List<NotificationModel>> groupNotificationsByDate(List<NotificationModel> notifications) {
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));

  String formatDate(DateTime date) {
    if (isSameDate(date, now)) return 'Today';
    if (isSameDate(date, yesterday)) return 'Yesterday';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  final Map<String, List<NotificationModel>> grouped = {};

  for (var notification in notifications) {
    final key = formatDate(notification.date);
    grouped.putIfAbsent(key, () => []).add(notification);
  }

  grouped.forEach((key, list) {
    list.sort((a, b) => b.date.compareTo(a.date));
  });

  List<String> sortedKeys = grouped.keys.toList();

  sortedKeys.sort((a, b) {
    DateTime parseDate(String key) {
      if (key == 'Today') return now;
      if (key == 'Yesterday') return yesterday;
      return DateTime.parse(key);
    }

    return parseDate(b).compareTo(parseDate(a));
  });

  final Map<String, List<NotificationModel>> sortedGrouped = {};

  for (var key in sortedKeys) {
    sortedGrouped[key] = grouped[key]!;
  }

  return sortedGrouped;
}
bool isSameDate(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}


