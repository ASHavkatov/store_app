import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../../../core/routing/routes.dart';
import '../blocs/verification_event.dart';
import '../widgets/reset_password_app_bar.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final emailController = TextEditingController();
  bool? emailValid;
  final formKey = GlobalKey<FormState>();

  bool isEmailValid(String email) => email.endsWith('gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: BlocBuilder<VerificationBloc, VerificationState>(
        builder: (context, state) {
          if (state.status == VerificationStatus.success) {
            Future.microtask(() => context.push(Routes.resetPassword));
          }
          return switch (state.status) {
            VerificationStatus.loading => Center(
              child: CircularProgressIndicator(),
            ),
            VerificationStatus.error => Center(child: Text("Xatolik bor")),
            _ => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreAppText(
                    title: "Forgot Password",
                    color: AppColors.primary900,
                    fontWeight: FontWeight.w600,
                    size: 32,
                  ),
                  SizedBox(height: 10.h),
                  StoreAppText(
                    title:
                        "Enter your email for the verification process. We will send 4 digits code to your email.",
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w400,
                    size: 16,
                  ),
                  SizedBox(height: 24.h),
                  StoreAppFormField(
                    controller:
                        context.read<VerificationBloc>().emailController,
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
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
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
                    text: "Send Code",
                    arrow: false,
                    color: AppColors.primary900,
                    callback: () {
                      context.read<VerificationBloc>().add(
                        VerificationEmailEvent(
                          email:
                              context
                                  .read<VerificationBloc>()
                                  .emailController
                                  .text
                                  .trim(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          };
        },
      ),
    );
  }
}
