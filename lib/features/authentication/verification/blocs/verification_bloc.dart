import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_event.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';

import '../../../../data/repositories/auth_repositories_models/auth_repository.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final AuthRepository _repo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  VerificationBloc({required AuthRepository repo})
    : _repo = repo,
      super(VerificationState.initial()) {
    on<VerificationEmailEvent>(_sendEmail);
    on<VerificationPasswordEvent>(_savePassword);
    on<VerificationCodeEvent>(_sendCode);
  }

  Future<void> _sendEmail(
      VerificationEmailEvent event,
      Emitter<VerificationState> emit,
      ) async {
    print("nimadir ${event.email}");
    emit(state.copyWith(status: VerificationStatus.loading)); // loading holat
    final result = await _repo.resetPassword(event.email);
    print(result);
    if (result) {
      emit(state.copyWith(status: VerificationStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VerificationStatus.error,
          message: "Parolni reset qilishda xatolik bor",
        ),
      );
    }
  }

  Future<void> _savePassword(
    VerificationPasswordEvent event,
    Emitter<VerificationState> emit,
  ) async {
    final result = await _repo.postResetEmailCodeReset(
      emailController.text.trim(),
      codeController.text.trim(),
      event.password,
    );
    if (result) {
      emit(state.copyWith(status: VerificationStatus.success));
    }  else{
      emit(state.copyWith(status: VerificationStatus.error));
    }
  }
  Future<void> _sendCode(VerificationCodeEvent event,Emitter<VerificationState> emit)async{
    final result = await _repo.postResetEmailCode(emailController.text.trim(), event.code);
    if (result) {
      emit(state.copyWith(status: VerificationStatus.success));
    }  else{
      emit(state.copyWith(status: VerificationStatus.error));
      throw Exception("Kod xato ketti");
    }
  }
}
