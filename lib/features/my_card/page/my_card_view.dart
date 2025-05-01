import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../checkout/widgets/order_summery.dart';
import '../widgets/my_cart_container.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "My Cart"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder:
                    (context, index) => Column(
                  children: [
                    MyCartContainer(
                      image: "assets/images/t-shirt.png",
                      title: "Regular Fit Slogan",
                      callback: () {},
                      clothsize: "Size L",
                      price: "1.1111", callbackminus: () {  }, callbackplus: () {  },
                    ),
                    SizedBox(height: 14.h),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 310.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 19),
                child: Column(
                  spacing: 16.h,
                  children: [
                    OrderSummary(title: "Sub-total", summary: "\$ 5,870"),
                    OrderSummary(title: "VAT(%)", summary: "\$ 0.00"),
                    OrderSummary(title: "Shipping fee", summary: "\$ 80"),
                    Divider(color: AppColors.primary200),
                    OrderSummary(title: "Total", summary: "\$ 5,870"),
                    SizedBox(height: 32.h),
                    StoreFloatingButton(
                      text: "Go To Checkout",
                      arrow: true,
                      callback: () {
                        context.push(Routes.checkout);
                      },
                      color: AppColors.primary900,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}