import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/new_card/blocs/new_card_bloc.dart';
import 'package:store_app/features/new_card/blocs/new_card_event.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../blocs/new_card_state.dart';

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
    return BlocListener<NewCardBloc, NewCardState>(
      listener: (context, state) {
        if (state.status == NewCardStatus.success) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                spacing: 5,
                children: [
                  Text(
                    "Card successfully added",
                    style: TextStyle(color: AppColors.successGreen, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SvgPicture.asset("assets/icons/true.svg", fit: BoxFit.cover),
                ],
              ),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))],
            ),
          );
        } else if (state.status == NewCardStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error adding card. Try again.")));
        }
      },
      child: Scaffold(
        appBar: StoreAppAppBar(title: "New Card", isTrue: true),
        body: BlocBuilder<NewCardBloc, NewCardState>(
          builder: (context, state) {
            return switch (state.status) {
              NewCardStatus.error => Center(child: Text("Xatolik bor")),
              NewCardStatus.success => Padding(
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
                                    if (value == null || !RegExp(r'^\d{2}/\d{2}$').hasMatch(value))
                                      return 'Invalid format';
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
                          if(formKey.currentState!.validate()){
                            context.read<NewCardBloc>().add(
                              PostNewCardEvent2(
                                cardNumber: cardNumController.text,
                                securityCode: cvsController.text,
                                expiryDate: expireNumController.text,
                              ),
                            );
                          }
                        },
                        color: AppColors.primary900,
                      ),
                    ],
                  ),
                ),
              ),
              NewCardStatus.idle => Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [CheckoutTitle(title: "Add Debit or Credit Card")],
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final newText = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i % 4 == 0 && i != 0) newText.write(' ');
      newText.write(digitsOnly[i]);
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    String newText = digits;
    if (digits.length >= 3) {
      newText = '${digits.substring(0, 2)}/${digits.substring(2)}';
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
