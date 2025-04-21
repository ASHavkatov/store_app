import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_event.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../common/presentations/store_app_form_field.dart';
import '../../../common/presentations/store_app_text.dart';
import '../../../common/presentations/store_sign_up_container.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool? emailValid, fullNameValid, passwordValid;
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
      body: BlocListener<SignUpBloc,SignUpState>(
        listener: (context, state)async{
          if(state.status == SignUpStatus.success){
            context.push(Routes.login);
          }
        },
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: SingleChildScrollView(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 55.h),
                  StoreAppText(
                    title: MyLocalizations.of(context)!.createAccount,
                    color: AppColors.primary900,
                    fontWeight: FontWeight.w600,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  StoreAppText(
                    title:
                    MyLocalizations.of(context)!.letsCreateAccount,
                    color: AppColors.primary500,
                    size: 16,
                  ),
                  SizedBox(height: 24.h),
                  StoreAppFormField(
                    isValid: fullNameValid,
                    title: MyLocalizations.of(context)!.fullName,
                    hintText: MyLocalizations.of(context)!.enterName,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary900,
                    size: 16,
                    controller: context.read<SignUpBloc>().fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        fullNameValid = false;
                        setState(() {});
                        return "This field is required";
                      }
                      fullNameValid = true;
                      setState(() {});
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  StoreAppFormField(
                    title: "Email",
                    isValid: emailValid,
                    hintText: MyLocalizations.of(context)!.enterEmail,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary900,
                    controller: context.read<SignUpBloc>().emailController,
                    size: 16,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        emailValid = false;
                        setState(() {});
                        return "This field is required";
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        emailValid = false;
                        setState(() {});
                        return "Enter a valid email address.";
                      }
                      emailValid = true;
                      setState(() {});
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  StoreAppFormField(
                    title: MyLocalizations.of(context)!.password,
                    hintText:
                    MyLocalizations.of(context)!.enterPassword,
                    isValid: passwordValid,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary900,
                    size: 16,
                    svg: "assets/icons/hide_password.svg",
                    controller: context.read<SignUpBloc>().passwordController,
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
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: MyLocalizations.of(context)!.agreeTo,
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms, ',
                            style: TextStyle(
                              color: AppColors.primary900,
                              fontSize: 15,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => context.go(Routes.terms),
                          ),
                          TextSpan(
                            text: 'Privacy Policy, ',
                            style: TextStyle(
                              color: AppColors.primary900,
                              fontSize: 15,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => context.go(Routes.privacy),
                          ),
                          TextSpan(
                            text: 'and ',
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
                              ..onTap =
                                  () =>
                                  context.go(Routes.cookieUse),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  StoreFloatingButton(
                    text: MyLocalizations.of(context)!.createAccount,
                    arrow: false,
                    color: getBackgroundColor(),
                    callback: () {
                      FocusScope.of(context).unfocus();
                      context.read<SignUpBloc>().add(SignUpLoading());
                      context.go(Routes.login);
                    },
                  ),
                  SizedBox(height: 24.h),
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
                    title: MyLocalizations.of(context)!.signUpGoogle,
                    svg: "assets/icons/google_logo.svg",
                    fontColor: AppColors.primary900,
                  ),
                  SizedBox(height: 16),
                  StoreSignUpContainer(
                    color: AppColors.darkBlue,
                    title: MyLocalizations.of(context)!.signUpFacebook,
                    svg: "assets/icons/facebook_logo.svg",
                    fontColor: Colors.white,
                  ),
                  SizedBox(height: 48.h),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: MyLocalizations.of(context)!.alreadyHave,
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: MyLocalizations.of(context)!.login,
                            style: TextStyle(
                              color: AppColors.primary900,
                              fontSize: 15,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => context.go(Routes.login),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
