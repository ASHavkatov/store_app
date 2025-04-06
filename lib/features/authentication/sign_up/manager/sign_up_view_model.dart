import 'package:flutter/material.dart';

import '../../../../data/repositories/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;
  final AuthRepository _authRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> signUp() async {
    final result = await _authRepo.signUp(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    return result;
  }
  Locale _currentLocale = Locale("en");

  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {

    if(_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }
}
