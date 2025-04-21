import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/data/repositories/auth_repositories_models/auth_repository.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_event.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _repo;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpBloc({required AuthRepository repo})
    : _repo = repo,
      super(SignUpState.initial()) {
    on<SignUpLoading>(_onLoad);
  }

  Future<void> _onLoad(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    try {
      final store = await _repo.signUp(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (store) {
        emit(state.copyWith(status: SignUpStatus.success));
      } else {
        emit(state.copyWith(status: SignUpStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}
