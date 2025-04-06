import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/authentication/reset_password/widgets/reset_password_app_bar.dart';
import 'package:pinput/pinput.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../../../core/routing/routes.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: ListView(
          children: [
            Text(
              "Enter 4 Digit Code",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                fontSize: 32,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Enter 4 digit code that your receive on your email (cody.fisher45@example.com).",
              style: TextStyle(
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Pinput(
                    defaultPinTheme: PinTheme(
                      width: 64.w,
                      height: 60.h,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "GeneralSans",
                        fontSize: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.1,
                            blurRadius: 0.1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    length: 4,
                    onCompleted: (pin) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Email not received?",
                        style: TextStyle(
                          fontFamily: "GeneralSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Resend code",
                          style: TextStyle(
                            fontFamily: "GeneralSans",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 171.h,),
                  StoreFloatingButton(text: "Continue", arrow: false, callback: (){
                      context.go(Routes.resetPassword);
                  }, color: Colors.black)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
