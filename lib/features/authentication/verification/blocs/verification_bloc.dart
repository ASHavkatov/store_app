import 'package:bloc/bloc.dart';
import 'package:store_app/core/secure_storege.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_event.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';

import '../../../../data/repositories/auth_repositories_models/auth_repository.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final AuthRepository _repo;

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
    emit(state.copyWith(status: VerificationStatus.loading));
    final result = await _repo.resetPassword(event.email);
    await SecureStorage.saveEmail(event.email);
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
    final email = await SecureStorage.getEmail();
    final code = await SecureStorage.getCode();
    final result = await _repo.postResetEmailCodeReset(
      email["email"]!,
      code["code"]!,
      event.password,
    );
    if (result) {
      emit(state.copyWith(status: VerificationStatus.success));
    } else {
      print("1111111111111111111111111111111111111111");
      emit(state.copyWith(status: VerificationStatus.error));
    }
  }

  Future<void> _sendCode(
    VerificationCodeEvent event,
    Emitter<VerificationState> emit,
  ) async {
    final email  = await SecureStorage.getEmail();
    final result = await _repo.postResetEmailCode(
      email["email"]!,
      event.code,
    );
    await SecureStorage.saveCode(event.code);
    if (result) {
      emit(state.copyWith(status: VerificationStatus.success));
    } else {
      emit(state.copyWith(status: VerificationStatus.error));
      throw Exception("Kod xato ketti");
    }
  }
}
