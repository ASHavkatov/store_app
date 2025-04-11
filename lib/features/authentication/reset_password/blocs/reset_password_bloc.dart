import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/auth_repositories_models/reset_password_repository.dart';
import 'package:store_app/features/authentication/reset_password/blocs/reset_password_event.dart';
import 'package:store_app/features/authentication/reset_password/blocs/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordRepository _repo;

  ResetPasswordBloc({required ResetPasswordRepository repo})
    : _repo = repo,
      super(ResetPasswordState.initinal());

  Future<void> _onResetPasswordSubmitted(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    try {
      await _repo.resetPassword(
        email: event.email,
        password: event.password,
        code: event.code,
      );
      emit(state.copyWith(status: ResetPasswordStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: ResetPasswordStatus.error, error: e.toString()),
      );
    }
  }
}
