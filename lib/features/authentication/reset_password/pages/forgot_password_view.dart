import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/colors.dart';
import '../../../onboarding/onboarding/widgets/store_floating_button.dart';
import '../../login/blocs/login_bloc.dart';
import '../../verification/widgets/reset_password_app_bar.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  final emailController = TextEditingController();
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
    TextEditingController controllerE;
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Text(
            "Forgot password",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "GeneralSans",
              fontSize: 32,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Enter your email for the verification process. We will send 4 digits code to your email.",
            style: TextStyle(
              fontFamily: "GeneralSans",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 24.h,),
          StoreAppFormField(
            isValid: emailValid,
            title: 'Email',
            hintText: MyLocalizations.of(context)!.enterEmail,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            controller: emailController,
            size: 16,
            validator: (value) {
              if (value == null || value.isEmpty) {
                emailValid = false;
                setState(() {});
                return "This field is required";
              }
              final emailRegex = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                emailValid = false;
                setState(() {});
                return "Enter a valid email address";
              }
              emailValid = true;
              setState(() {});
              return null;
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 107.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: StoreFloatingButton(text: "Send code", arrow: false, callback: (){
            context.go(Routes.verification);
          }, color: Colors.black),
        ),
      ),
    );
  }
}
