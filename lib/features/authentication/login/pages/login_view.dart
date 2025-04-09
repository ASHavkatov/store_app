import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/utils/colors.dart';
import '../../../../core/routing/routes.dart';
import '../../../common/presentations/store_app_form_field.dart';
import '../../../common/presentations/store_app_text.dart';
import '../../../common/presentations/store_sign_up_container.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? emailValid, passwordValid;
  final formKey = GlobalKey<FormState>();

  Color getBackgroundColor() {
    if (emailValid == null || passwordValid == null) {
      return AppColors.primary200;
    }
    if (!emailValid! || !passwordValid!) {
      return AppColors.primary200;
    }
    return AppColors.primary900;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 59.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreAppText(
                title: MyLocalizations.of(context)!.loginTo,
                color: Colors.black,
                size: 32,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              StoreAppText(
                title: MyLocalizations.of(context)!.itsGreat,
                color: Colors.black.withOpacity(0.5),
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 25.h),
              StoreAppFormField(isValid: true,
                title: 'Email',
                hintText: MyLocalizations.of(context)!.enterEmail,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                controller: emailController,
                size: 16,
                validator: (value){
                  if (value == null || value.isEmpty) {
                    emailValid = false;
                    setState(() {});
                    return "This field is required";
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    emailValid = false;
                    setState(() {});
                    return "Enter a valid email  address";
                  }
                  emailValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              StoreAppFormField(
                isValid: true,
                title: "Password",
                hintText: MyLocalizations.of(context)!.enterPassword,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                controller: passwordController,
                size: 16,
                // suffix: SvgPicture.asset('assets/icons/store_app_hide.svg'),
                validator: (value){
                  if(value == null || value.isEmpty){
                    passwordValid = false;
                    setState(() {});
                    return "This field is required";
                  }
                  passwordValid = true;
                  setState(() {});
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    MyLocalizations.of(context)!.forgotPassword,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.resetPassword);
                    },
                    child: Text(
                      MyLocalizations.of(context)!.resetPassword,
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
                color: getBackgroundColor(),
                callback: () {
                  formKey.currentState!.validate();
                },
              ),
              SizedBox(height: 34.h),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      MyLocalizations.of(context)!.or,
                      style:
                      TextStyle(color: AppColors.primary500, fontSize: 14),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24.h),
              StoreSignUpContainer(
                color: Colors.white,
                title: MyLocalizations.of(context)!.loginWithGoogle,
                svg: "assets/icons/google.svg",
                fontColor: Colors.black,
              ),
              SizedBox(height: 16.h),
              StoreSignUpContainer(
                color: AppColors.darkBlue,
                title: MyLocalizations.of(context)!.loginWithFacebook,
                svg: "assets/icons/facebook.svg",
                fontColor: Colors.white,
              ),
              SizedBox(height: 164.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: MyLocalizations.of(context)!.doNotHaveAccount,
                    style: TextStyle(
                        color: AppColors.primary500, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: MyLocalizations.of(context)!.join,
                        style: TextStyle(
                            color: AppColors.primary900, fontSize: 15),
                        recognizer: TapGestureRecognizer()
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
