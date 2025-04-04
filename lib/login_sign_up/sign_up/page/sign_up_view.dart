import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/presentations/store_app_form_field.dart';
import 'package:store_app/core/presentations/store_app_text.dart';
import 'package:store_app/core/presentations/store_sign_up_container.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/onboarding_screen_splash/onboarding/widgets/store_floating_button.dart';

import '../../../core/routing/routes.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: SingleChildScrollView(
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
                color: AppColors.primary500,
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
              SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: 'By signing up you agree to our ',
                  style: TextStyle(color: AppColors.primary500, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms ,',
                      style: TextStyle(
                        color: AppColors.primary900,
                        fontSize: 15,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.go(Routes.terms);
                            },
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppColors.primary900,
                        fontSize: 15,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.go(Routes.privacy);
                            },
                    ),
                    TextSpan(
                      text: ', and ',
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: 'Cookie Use',
                      style: TextStyle(
                        color: AppColors.primary900,
                        fontSize: 15,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              context.go(Routes.cookieUse);
                            },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              StoreFloatingButton(
                text: "Create an Account",
                arrow: false,
                color: AppColors.primary200,
                callback: () {},
              ),
              SizedBox(height: 24),
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
              SizedBox(height: 24),
              StoreSignUpContainer(
                color: Colors.white,
                title: "Sigh Up With Google",
                svg: "assets/icons/store_app_google.svg",
                fontColor: AppColors.primary900,
              ),
              SizedBox(height: 16),
              StoreSignUpContainer(
                color: AppColors.darkBlue,
                title: "Sigh Up With Facebook",
                svg: "assets/icons/store_app_facebook.svg",
                fontColor: Colors.white,
              ),
              SizedBox(height: 48),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: AppColors.primary500, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: AppColors.primary900,
                          fontSize: 15,
                        ),
                        recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.go(Routes.login);
                          },
                      )
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
