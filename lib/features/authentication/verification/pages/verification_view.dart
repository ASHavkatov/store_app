import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_event.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_state.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/reset_password_app_bar.dart';

class VerificationView extends StatefulWidget {
  VerificationView({super.key, required this.email});

  final String email;

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationBloc, VerificationState>(
      listener: (context, state) {
        if (state.status == VerificationStatus.success) {
          context.push(
            Routes.resetPassword,
            extra: {"email": widget.email, "code": controller.text},
          );
        }else if (state.status == VerificationStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Kiritilgan kod noto‘g‘ri")),
          );
        }
      },
      child: Scaffold(
        appBar: ResetPasswordAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: ListView(
            children: [
              Text(
                MyLocalizations.of(context)!.fourDigit,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 8),
              Text(
                MyLocalizations.of(context)!.fourDigitExample,
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
                      controller: controller,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MyLocalizations.of(context)!.emailNorReceived,
                          style: TextStyle(
                            fontFamily: "GeneralSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            MyLocalizations.of(context)!.resendCode,
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
                    SizedBox(height: 171.h),
                    StoreFloatingButton(
                      color: AppColors.primary900,
                      text: "Continue",
                      arrow: false,
                      callback: () {
                        context.read<VerificationBloc>().add(
                          VerificationCodeEvent(
                            code: controller.text,
                            email: widget.email,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
