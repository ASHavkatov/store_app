import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/verification/widgets/reset_password_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

class ResetPasswordView extends StatefulWidget {
  ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  bool? passwordValid, confirmValid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreAppText(
              title: "Reset Password",
              color: AppColors.primary900,
              fontWeight: FontWeight.w600,
              size: 32,
            ),
            SizedBox(height: 4),
            StoreAppText(
              title:
                  "Set the new password for your account so you can login and access all the features.",
              color: AppColors.primary500,
              size: 18,
            ),
            SizedBox(height: 24.h),
            StoreAppFormField(
              controller: passwordController,
              svg: "assets/icons/hide_password.svg" ,
              title: "Password",
              hintText: "Enter Password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  passwordValid = false;
                  setState(() {});
                  return "This field is required";
                }
                passwordValid = true;
                setState(() {});
                return null;
              },
              isValid: passwordValid,
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              size: 16,
            ),
            SizedBox(height: 16.h),
            StoreAppFormField(
              controller: confirmController,
              svg: "assets/icons/hide_password.svg",
              title: "Confirm Password",
              hintText: "Confirm Password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  confirmValid = false;
                  setState(() {});
                  return "This field is required";
                }
                confirmValid = true;
                setState(() {});
                return null;
              },
              isValid: confirmValid,
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              size: 16,
            ),
            SizedBox(height: 100.h),
            StoreFloatingButton(text: "Continue", arrow: false, callback: (){}, color: AppColors.primary900)
          ],
        ),
      ),
    );
  }
}
