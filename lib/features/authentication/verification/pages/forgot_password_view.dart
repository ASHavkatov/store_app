import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_event.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';
import '../../../../core/routing/routes.dart';
import '../../../common/presentations/store_app_form_field.dart';
import '../widgets/forget_text.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();

  bool? emailValid;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: ""),
      body: BlocListener<VerificationBloc, VerificationState>(
        listener: (context, state) {
          if (state.status == VerificationStatus.success) {
            context.go(Routes.verification, extra: emailController.text.trim());
          } else if (state.status == VerificationStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Noma’lum xatolik')),
            );
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 14.h, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ForgetText(title: "Forgot password", text: "Enter your email for the verification process. We will send 4 digits code to your email.",),
                SizedBox(height: 24.h),
                StoreAppFormField(
                  fontWeight: FontWeight.w600,
                  size: 24,
                  color: AppColors.primary900,
                  controller: emailController,
                  isValid: emailValid,
                  autoValidateMode: AutovalidateMode.disabled,
                  title: "Email",
                  hintText: "Enter your email address",
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
                    setState(() {});
                    return null;
                  },
                ),
                const Spacer(),
                BlocBuilder<VerificationBloc, VerificationState>(
                  builder: (context, state) {
                    return StoreFloatingButton(
                      arrow: false,
                      text: state.status == VerificationStatus.loading ? "Send Code" : "Sending...",
                      width: double.infinity,
                      height: 54.h,
                      color: AppColors.primary900,
                      callback: () {
                        if (formKey.currentState!.validate()) {
                          context.read<VerificationBloc>().add(
                            VerificationEmailEvent(
                              email: emailController.text.trim(),
                            ),
                          );
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

