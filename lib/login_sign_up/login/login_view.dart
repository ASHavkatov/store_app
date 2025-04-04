import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/presentations/store_app_form_field.dart';
import 'package:store_app/core/presentations/store_app_text.dart';
import 'package:store_app/core/utils/colors.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            StoreAppText(
              title: "Create an account",
              color: AppColors.primary900,
              fontWeight: FontWeight.w600,
              size: 32,
            ),
            SizedBox(height: 8),
            StoreAppText(
              title: "Let's create your account",
              color: AppColors.primary400,
              size: 16,
            ),
            SizedBox(height: 24),
            StoreAppFormField(
              title: "Full Name",
              hintText: "Enter your full name",
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              controller: nameController,
            ),
            SizedBox(height: 16),
            StoreAppFormField(
              title: "Email",
              hintText: "Enter your email address",
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              controller: emailController,
            ),
            SizedBox(height: 16),
            StoreAppFormField(
              title: "Password",
              hintText: "Enter your password",
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              controller: passwordController,
              suffix: SvgPicture.asset("assets/icons/store_app_hide.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
