String formatDate(String dateString) {
  DateTime date = DateTime.tryParse(dateString) ?? DateTime(2000, 1, 1);
  DateTime now = DateTime.now();
  Duration difference = now.difference(date);

  if (difference.inDays >= 365) {
    int years = (difference.inDays / 365).floor().clamp(0, 99);
    return "$years ${years == 1 ? 'year' : 'years'} ago";
  } else if (difference.inDays >= 30) {
    int months = (difference.inDays / 30).floor().clamp(0, 11);
    return "$months ${months == 1 ? 'month' : 'months'} ago";
  } else if (difference.inDays >= 1) {
    return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
  } else {
    return "Just now";
  }
}
