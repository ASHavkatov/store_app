import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import '../../../../core/routing/routes.dart';
import '../../../comman/presentations/store_app_form_field.dart';
import '../../../comman/presentations/store_app_text.dart';
import '../../../comman/presentations/store_sign_up_container.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool? isTrue;

  bool isValid(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 59.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreAppText(
                title: "Login to your account",
                color: Colors.black,
                size: 32,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              StoreAppText(
                title: "It’s great to see you again.",
                color: Colors.black.withValues(alpha: 0.5),
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 25.h),
              StoreAppFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  } else if (!isValid(value)) {
                    return "Email doesn't match!";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    isTrue = isValid(value);
                  });
                },
                suffix: () {
                  if (isTrue == null) {
                    return const SizedBox();
                  } else if (isTrue == true) {
                    return SvgPicture.asset("assets/icons/store_app_true.svg");
                  } else {
                    return SvgPicture.asset("assets/icons/store_app_false.svg");
                  }
                }(),
                title: 'Email',
                hintText: "Enter your email address",
                fontWeight: FontWeight.w500,
                color: Colors.black,
                controller: emailController,
                size: 16,
              ),

              SizedBox(height: 16.h),
              StoreAppFormField(
                title: "Password",
                hintText: "Enter your password",
                fontWeight: FontWeight.w500,
                color: Colors.black,
                controller: passwordController,
                size: 16,
                suffix: SvgPicture.asset('assets/icons/store_app_hide.svg'),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    'Forgot your password? ',
                    style: TextStyle(
                      color: Colors.black.withValues(alpha: 0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.resetPassword);
                    },
                    child: Text(
                      "Reset your password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              StoreFloatingButton(
                text: "Login",
                arrow: false,
                callback: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Malades")));
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Utolmading")));
                  }
                },
                color: AppColors.primary900,
              ),

              SizedBox(height: 34),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24.h),
              StoreSignUpContainer(
                color: Colors.white,
                title: "Login with Google",
                svg: "assets/icons/store_app_google.svg",
                fontColor: Colors.black,
              ),
              SizedBox(height: 16.h),
              StoreSignUpContainer(
                color: AppColors.darkBlue,
                title: "Login with Facebook",
                svg: "assets/icons/store_app_facebook.svg",
                fontColor: Colors.white,
              ),
              SizedBox(height: 164.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don’t have an account?  ",
                    style: TextStyle(color: AppColors.primary500, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Join',
                        style: TextStyle(
                          color: AppColors.primary900,
                          fontSize: 15,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                context.go(Routes.signUp);
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
