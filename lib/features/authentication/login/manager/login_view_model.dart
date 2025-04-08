// import 'package:flutter/material.dart';
//
// import '../../../../data/repositories/auth_repository.dart';
//
// class LoginViewModel extends ChangeNotifier {
//   LoginViewModel({required AuthRepository repo}) : _repo = repo;
//
//   final AuthRepository _repo;
//
//   final formKey = GlobalKey<FormState>();
//   String? _errorMessage;
//   final loginController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool isEmailValid = false;
//   bool isPasswordValid = false;
//   bool isTextFieldValid = false;
//   bool isLoading = false;
//
//   bool get hasError => _errorMessage != null;
//
//   Future<bool> login() async {
//     if (!formKey.currentState!.validate()) return false;
//
//     isLoading = true;
//     _errorMessage = null;
//     notifyListeners();
//
//     try {
//       final login = loginController.text.trim();
//       final password = passwordController.text.trim();
//
//       await _repo.login(login, password);
//     } on Exception catch (e) {
//       _errorMessage = e.toString();
//       isLoading = false;
//       notifyListeners();
//       return false;
//     }
//
//     isLoading = false;
//     notifyListeners();
//     return true;
//   }
//
//   String? validateEmail(String? email) {
//     if (email == null || email.isEmpty) {
//       return "Email maydoni bo'sh bo'lmasligi kerak";
//     } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
//       return "Iltimos, to'g'ri email kiriting";
//     }
//     return null;
//   }
//
//   String? validatePassword(String? password) {
//     if (password == null || password.isEmpty) {
//       return "Parol maydoni bo'sh bo'lmasligi kerak";
//     } else if (password.length < 8) {
//       return "Parol 8 ta belgidan kam bo'lmasligi kerak";
//     } else if (!RegExp(
//       r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$',
//     ).hasMatch(password)) {
//       return "Parolda 1 ta katta harf, 1 ta raqam va 1 ta maxsus belgi bo'lishi kerak";
//     }
//     return null;
//   }
//
//   bool validateForm(String email, String password) {
//     isEmailValid = validateEmail(email) == null;
//     isPasswordValid = validatePassword(password) == null;
//     return isEmailValid && isPasswordValid;
//   }
// }
