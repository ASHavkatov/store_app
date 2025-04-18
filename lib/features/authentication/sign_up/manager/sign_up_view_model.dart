import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/authentication/sign_up/widgets/sign_up_successfully.dart';

import '../../../../core/routing/routes.dart';
import '../../../../data/repositories/auth_repositories_models/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;
  final AuthRepository _authRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? fullNameValid, emailValid, passwordValid;



  String? validateFullName(String? name) {
    if (name == null || name.isEmpty) {
      return "Iltimos ismingizni kiriting";
    }
    final parts = name.trim().split(" ");
    if (parts.length < 2) {
      return "Iltimos Ism Familiyangizni kiriting";
    }
    final isValid = parts.every(
      (part) => RegExp(r'^[a-zA-Z]+$').hasMatch(part),
    );
    if (!isValid) {
      return "Faqat harflardan iborat bulishi shart";
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Iltimos emailni kriting";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Iltimos emailni to'g'ri kiriting";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Iltimos parolni kiriting";
    } else if (password.length < 8) {
      return "Parol 8 tadan kam bulmasligi kerak";
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{6,}$').hasMatch(password)) {
      return "Parolda 1 ta katta harf va 1 ta raqam bulishi shart";
    }
    return null;
  }

  Future signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final result = await _authRepo.signUp(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    if (result && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => const SuccessfulSignUpDialog(),
      );
      Future.delayed(
        Duration(seconds: 3),
      ).then((value) => context.go(Routes.home));
    }
  }



  Locale _currentLocale = Locale("en");

  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }
}
