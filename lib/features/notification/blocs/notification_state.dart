
import 'package:store_app/data/models/notification_model/notification_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_state.freezed.dart';

enum NotificationStatus{loading, error, idle}


@freezed
abstract class NotificationState with _$NotificationState{
  const factory NotificationState({required NotificationStatus? status, required List<NotificationModel> model}) = _NotificationState;


  factory NotificationState.initial(){
    return NotificationState(status: NotificationStatus.loading, model: []);
  }
}