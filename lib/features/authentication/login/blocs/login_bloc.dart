import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/authentication/login/blocs/login_event.dart';
import 'package:store_app/features/authentication/login/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;

  LoginBloc({required AuthRepository repo})
    : _repo = repo,
      super(LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _repo.login(login: event.email, password: event.password);

      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, error: e.toString()));
    }
  }
}
