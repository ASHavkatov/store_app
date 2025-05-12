import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repositories/notification/notification_repository.dart';
import 'package:store_app/features/notification/blocs/notification_event.dart';
import 'package:store_app/features/notification/blocs/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repo;

  NotificationBloc({required NotificationRepository repo})
    : _repo = repo,
      super(NotificationState.initial()) {
    on<NotificationLoad>(_onLoad);
    add(NotificationLoad());
  }

  Future<void> _onLoad(
    NotificationLoad event,
    Emitter<NotificationState> emit,
  ) async {
    final notification = await _repo.fetchNotification();
    emit(state.copyWith(status: NotificationStatus.idle, model: notification));
  }
}
