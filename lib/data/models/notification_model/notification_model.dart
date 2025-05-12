import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final int id;
  final String title;
  final String icon;
  final String content;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.content,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic>json)=> _$NotificationModelFromJson(json);
}
