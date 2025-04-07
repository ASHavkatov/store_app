import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/login/manager/login_view_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../common/presentations/store_app_form_field.dart';
import '../../../common/presentations/store_app_text.dart';
import '../../../common/presentations/store_sign_up_container.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';




class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.vm});
  final LoginViewModel vm;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(repo: context.read()),
      builder:
          (context, child)
      { final vm = context.watch<LoginViewModel>();
            return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: vm.formKey,
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
                      color: Colors.black.withValues(alpha: 0.5),
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 25.h),
                    Consumer<LoginViewModel>(
                      builder:(context, vm, _)=> Column(
                        children: [
                          StoreAppFormField(
                            validator: vm.validateEmail,
                            title: 'Email',
                            hintText: MyLocalizations.of(context)!.enterEmail,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            controller: vm.loginController,
                            isValid: vm.isEmailValid,
                            size: 16,
                            // suffix: ,
                          ),

                          SizedBox(height: 16.h),
                          StoreAppFormField(
                            validator: (value)=> vm.validatePassword(value),
                            title: "Password",
                            hintText: MyLocalizations.of(context)!.enterPassword,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            controller: vm.passwordController,
                            size: 16,
                            isValid: vm.isPasswordValid,
                            // suffix: SvgPicture.asset(
                            //   'assets/icons/store_app_hide.svg',
                            // ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          MyLocalizations.of(context)!.forgotPassword,
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
                      callback: () async{
                        if ( vm.isPasswordValid && context.mounted) {

                        }
                      },
                      color: AppColors.primary900,
                    ),

                    SizedBox(height: 34.h),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                         Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            MyLocalizations.of(context)!.or,
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
                      title: MyLocalizations.of(context)!.loginWithGoogle,
                      svg: "assets/icons/store_app_google.svg",
                      fontColor: Colors.black,
                    ),
                    SizedBox(height: 16.h),
                    StoreSignUpContainer(
                      color: AppColors.darkBlue,
                      title: MyLocalizations.of(context)!.loginWithFacebook,
                      svg: "assets/icons/store_app_facebook.svg",
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 164.h),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: MyLocalizations.of(context)!.doNotHaveAccount,
                          style: TextStyle(
                            color: AppColors.primary500,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: MyLocalizations.of(context)!.join,
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
          },
    );
  }
}
