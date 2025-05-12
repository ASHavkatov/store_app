import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/my_card/blocs/my_cart_state.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../../checkout/widgets/order_summery.dart';
import '../blocs/my_cart_bloc.dart';
import '../widgets/my_cart_container.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "My Cart"),
      body: BlocBuilder<MyCartBloc, MyCartState>(
        builder: (context, state) {
          final data = state.model;
          return switch (state.status) {
            MyCartStatus.error => Center(child: Text("Xatoli bor")),
            MyCartStatus.loading => Center(child: CircularProgressIndicator()),
            MyCartStatus.idle => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final cart = state.model.items[index];
                        return Column(
                          children: [
                            MyCartContainer(
                              image: cart.image,
                              title: cart.title,
                              callback: () {},
                              clothsize: cart.size,
                              price: cart.price.toString(),
                              callbackminus: () {},
                              callbackplus: () {},
                            ),
                            SizedBox(height: 14.h),
                          ],
                        );
                      },
                      itemCount: state.model.items.length,
                    ),
                  ),
                  SizedBox(
                    height: 310.h,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 19),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 16.h,
                        children: [
                          OrderSummary(
                            title: "Sub-total",
                            summary: "\$ ${data.subTotal}",
                          ),
                          OrderSummary(
                            title: "VAT(%)",
                            summary: "\$ ${data.vat}",
                          ),
                          OrderSummary(
                            title: "Shipping fee",
                            summary: "\$ ${data.shippingFee}",
                          ),
                          Divider(color: AppColors.primary200),
                          OrderSummary(
                            title: "Total",
                            summary: "\$ ${data.total}",
                          ),
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
          };
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
