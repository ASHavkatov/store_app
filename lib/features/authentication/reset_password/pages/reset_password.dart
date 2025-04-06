import 'package:flutter/material.dart';
import 'package:store_app/features/authentication/reset_password/widgets/reset_password_app_bar.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResetPasswordAppBar(),
    );
  }
}
