import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/cards/widgets/add_container.dart';
import 'package:store_app/features/cards/widgets/card_container.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../blocs/card_bloc.dart';
import '../blocs/card_state.dart';

class PaymentMethod extends StatefulWidget {
   PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Payment Method"),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          return switch (state.status) {
            CardStatus.loading => Center(child: CircularProgressIndicator()),
            CardStatus.error => Center(child: Text("Something went wrong")),
            CardStatus.idle => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1.h, color: AppColors.primary100),
                  SizedBox(height: 20.h),
                  StoreAppText(
                    title: "Saved Cards",
                    color: AppColors.primary900,
                    fontWeight: FontWeight.w600,
                    size: 16,
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: state.model!.length,
                      itemBuilder: (context, index) => CardContainer(index: index,groupValue: selectedIndex,onChanged: (value){
                        setState(() {
                          selectedIndex = value!;
                        });
                      },),
                      separatorBuilder: (context, index) => SizedBox(height: 10.h),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  AddContainer(),
                ],
              ),
            ),
          };
        },
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left: 24.w, right: 24.w,bottom: 10.h),
        child: StoreFloatingButton(
          text: "Apply",
          arrow: false,
          callback: () => context.push(Routes.newCard),
          color: AppColors.primary900,
        ),
      ),
    );
  }
}
