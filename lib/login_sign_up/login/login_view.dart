import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/presentations/store_app_form_field.dart';
import 'package:store_app/core/presentations/store_app_text.dart';
import 'package:store_app/core/presentations/store_sign_up_container.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/onboarding_screen_splash/onboarding/widgets/store_floating_button.dart';

import '../../core/routing/routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 59),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoreAppText(
              title: "Login to your account",
              color: Colors.black,
              size: 32,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            StoreAppText(
              title: "It’s great to see you again.",
              color: Colors.black.withValues(alpha: 0.5),
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 25),
            StoreAppFormField(
              title: 'Email',
              hintText: "Enter your email address",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              controller: emailController,
              size: 16,
            ),
            SizedBox(height: 16),
            StoreAppFormField(
              title: "Password",
              hintText: "Enter your password",
              fontWeight: FontWeight.w500,
              color: Colors.black,
              controller: passwordController,
              size: 16,
              suffix: SvgPicture.asset('assets/icons/store_app_hide.svg'),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 24),
            StoreFloatingButton(
              text: "Login",
              arrow: false,
              callback: () {},
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
                    style: TextStyle(color: AppColors.primary500, fontSize: 14),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 24),
            StoreSignUpContainer(
              color: Colors.white,
              title: "Login with Google",
              svg: "assets/icons/store_app_google.svg",
              fontColor: Colors.black,
            ),
            SizedBox(height: 16),
            StoreSignUpContainer(
              color: AppColors.darkBlue,
              title: "Login with Facebook",
              svg: "assets/icons/store_app_facebook.svg",
              fontColor: Colors.white,
            ),
            SizedBox(height: 212),
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
                            ..onTap = () {();},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
