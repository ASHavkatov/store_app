import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/repositories/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc({required AuthRepository repo})
      : _repo = repo,
        super(LoginState.initial()) {
    on<LoginLoad>(_load);
  }

  Future<void> _load(LoginLoad event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final store = await _repo.login(
        loginController.text,
        passwordController.text,
      );

      if (store) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
