import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../widgets/add_promo.dart';
import '../widgets/card_pay.dart';
import '../widgets/cash_pay.dart';
import '../widgets/order_summery.dart';
import '../widgets/payment_container.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView>
    with SingleTickerProviderStateMixin {
  int selectedPaymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Checkout", isTrue: true),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckoutTitle(title: 'Delivery Address'),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        'Change',

                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.primary900,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map_pin.svg"),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            color: AppColors.primary900,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '925 S Chugach St #APT 10, Alaska 99645',
                          style: TextStyle(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Divider(height: 1, color: AppColors.primary100),
                SizedBox(height: 20.h),
                CheckoutTitle(title: 'Payment Method'),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PaymentContainer(
                      onTap: () {
                        setState(() {
                          selectedPaymentIndex = 0;
                        });
                      },
                      svg: "assets/icons/card.svg",
                      text: 'Card',
                      isSelected: selectedPaymentIndex == 0,
                    ),
                    PaymentContainer(
                      onTap: () {
                        setState(() {
                          selectedPaymentIndex = 1;
                        });
                      },
                      svg: "assets/icons/cash.svg",
                      text: 'Cash',
                      isSelected: selectedPaymentIndex == 1,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                if (selectedPaymentIndex == 0) CardPay(onTap: () {}),
                if (selectedPaymentIndex == 1) CashPay(),
                SizedBox(height: 20.h),
                Divider(color: Colors.grey),
                SizedBox(height: 20.h),
                CheckoutTitle(title: "Order Summary"),
                SizedBox(height: 16.h),
                Column(
                  spacing: 16.h,
                  children: [
                    OrderSummary(title: "Sub-total", summary: "\$ 5,870"),
                    OrderSummary(title: "VAT(%)", summary: "\$ 0.00"),
                    OrderSummary(title: "Shipping fee", summary: "\$ 80"),
                    Divider(color: AppColors.primary200),
                  ],
                ),
                SizedBox(height: 16.h),
                OrderSummary(title: "Total", summary: "\$ 5,870"),
                SizedBox(height: 16.h),
                SizedBox(child: AddPromo(onTap: () {})),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 31.h, left: 25.w, right: 25.w),
        child: StoreFloatingButton(
          text: "Place Order",
          arrow: false,
          callback: () {},
          color: AppColors.primary900,
        ),
      ),
    );
  }
}
