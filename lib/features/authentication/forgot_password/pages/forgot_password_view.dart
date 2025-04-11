import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../verification/widgets/reset_password_app_bar.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final emailController = TextEditingController();
  bool? emailValid;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreAppText(
              title: MyLocalizations.of(context)!.forgotPasswordTitle,
              color: AppColors.primary900,
              fontWeight: FontWeight.w600,
              size: 32,
            ),
            SizedBox(height: 10.h),
            StoreAppText(
              title:
                  MyLocalizations.of(context)!.forgotPasswordSubtitle,
              color: AppColors.primary500,
              fontWeight: FontWeight.w400,
              size: 16,
            ),
            SizedBox(height: 24.h),
            StoreAppFormField(
              controller: emailController,
              title: "Email",
              hintText: "cody.fisher45@example.com",
              isValid: emailValid,
              fontWeight: FontWeight.w500,
              color: AppColors.primary900,
              size: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  emailValid = false;
                  return "This field is required.";
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  emailValid = false;
                  return "Enter a valid email address.";
                }
                emailValid = true;
                return null;
              },
            ),
            SizedBox(height: 150.h),
            StoreFloatingButton(
              text: MyLocalizations.of(context)!.sendCode,
              arrow: false,
              callback: () {},
              color: AppColors.primary900,
            ),
          ],
        ),
      ),
    );
  }
}
