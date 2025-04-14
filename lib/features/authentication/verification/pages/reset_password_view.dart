import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_event.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';
import 'package:store_app/features/authentication/verification/widgets/forget_text.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';

import '../../../../core/routing/routes.dart';
import '../../../common/presentations/store_text_button.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email, required this.code});


  final String email;
  final String code;
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool? passwordOneValid, passwordTwoValid;
  final passwordControllerOne = TextEditingController();
  final passwordControllerTwo = TextEditingController();


  final formKey = GlobalKey<FormState>();

  Color getBackgroundColor() {
    if (passwordOneValid == null || passwordTwoValid == null) {
      return AppColors.primary200;
    }

    if (!passwordOneValid! || !passwordTwoValid!) {
      return AppColors.primary200;
    }

    return AppColors.primary900;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Your password has been successfully reset."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                context.go(Routes.login); // Navigate to login
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: ""),
      body: BlocListener<VerificationBloc, VerificationState>(
        listener: (context, state) {
          if (state.status == VerificationStatus.success) {
            _showSuccessDialog();
          } else if (state.status == VerificationStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Something went wrong')),
            );
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 14, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ForgetText(title: "Reset Password", text: "Set the new password for your account so you can login and access all the features."),
                SizedBox(height: 24),
                StoreAppFormField(
                  fontWeight: FontWeight.w500,
                  size: 16,
                  color: AppColors.primary900,
                  controller: passwordControllerOne,
                  isValid: passwordOneValid,
                  title: "Password",
                  hintText: "Enter your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      passwordOneValid = false;
                      setState(() {});
                      return "This field is required.";
                    }
                    if (value.length < 6) {
                      passwordOneValid = false;
                      setState(() {});
                      return "Password must be at least 6 characters.";
                    }
                    passwordOneValid = true;
                    setState(() {});
                    return null;
                  },
                ),
                SizedBox(height: 16),
                StoreAppFormField(
                  fontWeight: FontWeight.w500,
                  size: 16,
                  color: AppColors.primary900,
                  controller: passwordControllerTwo,
                  isValid: passwordTwoValid,
                  title: "Confirm Password",
                  hintText: "Repeat your password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      passwordTwoValid = false;
                      setState(() {});
                      return "This field is required.";
                    }
                    if (value != passwordControllerOne.text) {
                      passwordTwoValid = false;
                      setState(() {});
                      return "Passwords do not match.";
                    }
                    passwordTwoValid = true;
                    setState(() {});
                    return null;
                  },
                ),
                const Spacer(),
            BlocBuilder<VerificationBloc, VerificationState>(
              builder: (context, state) {
                return StoreTextButton(
                  text: state.status == VerificationStatus.loading ? "Resetting..." : "Continue",
                  width: double.infinity,
                  height: 54,
                  backgroundColor: getBackgroundColor(),
                  callback: () {
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      context.read<VerificationBloc>().add(
                        VerificationPasswordEvent(
                          email: widget.email,
                          code: widget.code,
                          password: passwordControllerOne.text,
                        ),
                      );
                    }else{
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Success"),
                            content: const Text("Xatolik ketti naxuy jala"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close dialog
                                  context.go(Routes.login); // Navigate to login
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
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
