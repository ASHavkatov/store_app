import 'package:flutter/material.dart';
import '../../../../data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;
  String? _errorMessage;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  bool get hasError => _errorMessage != null;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    try {
      await _repo.login(loginController.text, passwordController.text);
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
    _errorMessage == null;
    notifyListeners();
    return true;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email maydoni bo'sh bo'lmasligi kerak";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Iltimos, to'g'ri email kiriting";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Parol maydoni bo'sh bo'lmasligi kerak";
    } else if (password.length < 8) {
      return "Parol 6 ta belgidan kam bo'lmasligi kerak";
    } else if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$',
    ).hasMatch(password)) {
      return "Parolda 1 ta katta harf, 1 ta raqam va 1 ta maxsus belgi bo'lishi kerak";
    }
    return null;
  }

  bool validateForm(String email, String password) {
    isEmailValid = validateEmail(email) == null;
    isPasswordValid = validatePassword(password) == null;

    return isEmailValid && isPasswordValid;
  }
}
