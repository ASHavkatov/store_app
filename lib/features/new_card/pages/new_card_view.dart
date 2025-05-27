import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/new_card/blocs/new_card_bloc.dart';
import 'package:store_app/features/new_card/blocs/new_card_event.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../blocs/new_card_state.dart';
import '../widgets/card_formatted.dart';
import '../widgets/input_formatted.dart';

class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumController = TextEditingController();
    final TextEditingController cvsController = TextEditingController();
    final TextEditingController expireNumController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: StoreAppAppBar(title: "New Card", isTrue: true,callback: (){context.pop();},),
      body: BlocListener<NewCardBloc, NewCardState>(
          listener: (context, state) {
            if (state.status == NewCardStatus.success) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  content: Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    width: 341.w,
                    height: 270.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/validation_success.svg", width: 78, height: 78),
                        SizedBox(height: 12.h),
                        Text(
                          "Congratulations!",
                          style: TextStyle(color: AppColors.primary900, fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Your new card has been added.",
                          style: TextStyle(color: AppColors.primary500, fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        StoreFloatingButton(
                          text: "Thanks",
                          arrow: false,
                          callback: () {
                            Navigator.of(context).pop();
                            context.go(Routes.card);
                          },
                          color: AppColors.primary900,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },

          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CheckoutTitle(title: "Add Debit or Credit Card", fontSize: 16, fontWeight: FontWeight.w600),
                SizedBox(height: 16.h),
                CheckoutTitle(title: "Card Number", fontSize: 16, fontWeight: FontWeight.w500),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: cardNumController,
                  inputFormatters: [CardNumberInputFormatter()],
                  keyboardType: TextInputType.number,
                  maxLength: 19,
                  decoration: InputDecoration(
                    hintText: "Enter your card number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  validator: (value) {
                    final digits = value?.replaceAll(' ', '') ?? '';
                    if (digits.length != 16) return 'Enter a valid 16-digit card number';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutTitle(title: "Expiry Date", fontSize: 16, fontWeight: FontWeight.w500),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: expireNumController,
                            inputFormatters: [ExpiryDateInputFormatter()],
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            validator: (value) {
                              if (value == null || !RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) return 'Invalid format';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutTitle(title: "Security Code", fontSize: 16, fontWeight: FontWeight.w500),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: cvsController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: InputDecoration(
                              hintText: "CVC",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 3 || value.length > 4) return 'Invalid CVV';
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 350.h),
                StoreFloatingButton(
                  text: "Add Card",
                  arrow: false,
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      context.read<NewCardBloc>().add(
                        NewCardLoad(
                          cardNumber: cardNumController.text,
                          securityCode: cvsController.text,
                          expiryDate: expireNumController.text,
                        ),
                      );
                      context.go(Routes.card);
                    }
                  },
                  color: AppColors.primary900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
