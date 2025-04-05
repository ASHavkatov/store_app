import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/sign_up/blocs/sign_up_view_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../comman/presentations/store_app_form_field.dart';
import '../../../comman/presentations/store_app_text.dart';
import '../../../comman/presentations/store_sign_up_container.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.vm});

final SignUpViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context)=> SignUpViewModel(authRepo: context.read()),
      builder:(context, child){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SingleChildScrollView(
              child: Form(
                key: vm.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      title: MyLocalizations.of(context)!.letsCreateAccount,
                      color: AppColors.primary500,
                      size: 16,
                    ),
                    SizedBox(height: 24.h),
                    StoreAppFormField(
                      title: MyLocalizations.of(context)!.fullName,
                      hintText: MyLocalizations.of(context)!.enterName,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary900,
                      controller: vm.fullNameController,
                    ),
                    SizedBox(height: 16),
                    StoreAppFormField(
                      title: "Email",
                      hintText: MyLocalizations.of(context)!.enterEmail,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary900,
                      controller: vm.emailController,
                    ),
                    SizedBox(height: 16.h),
                    StoreAppFormField(
                      title: MyLocalizations.of(context)!.password,
                      hintText: MyLocalizations.of(context)!.enterPassword,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary900,
                      controller: vm.passwordController,
                      suffix: SvgPicture.asset("assets/icons/store_app_hide.svg"),
                    ),
                    SizedBox(height: 12.h),
                    Text.rich(
                      TextSpan(
                        text: MyLocalizations.of(context)!.agreeTo,
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
                    SizedBox(height: 24.h),
                    StoreFloatingButton(
                      text: MyLocalizations.of(context)!.createAccount,
                      arrow: false,
                      color: AppColors.primary200,
                      callback: () {

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
                      svg: "assets/icons/store_app_google.svg",
                      fontColor: AppColors.primary900,
                    ),
                    SizedBox(height: 16),
                    StoreSignUpContainer(
                      color: AppColors.darkBlue,
                      title: MyLocalizations.of(context)!.signUpFacebook,
                      svg: "assets/icons/store_app_facebook.svg",
                      fontColor: Colors.white,
                    ),
                    SizedBox(height: 63.h),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: MyLocalizations.of(context)!.alreadyHave,
                          style: TextStyle(color: AppColors.primary500, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: MyLocalizations.of(context)!.login,
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
          ),
        );
      },
    );
  }
}
