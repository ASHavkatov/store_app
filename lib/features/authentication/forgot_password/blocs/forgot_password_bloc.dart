import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/auth_repositories_models/forgot_password_repository.dart';
import 'package:store_app/features/authentication/forgot_password/blocs/forgot_password_event.dart';
import 'package:store_app/features/authentication/forgot_password/blocs/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordRepository _repo;

  ForgotPasswordBloc({required ForgotPasswordRepository repo})
    : _repo = repo,
      super(ForgotPasswordState.initial()) {
    on<ForgotPasswordSubmitted>(_onEmailSubmitted);
  }

  Future<void> _onEmailSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    try {
      await _repo.forgotPassword(email: event.email);
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: ForgotPasswordStatus.error, error: e.toString()),
      );
    }
  }
}
