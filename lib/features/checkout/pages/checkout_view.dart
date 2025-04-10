import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Checkout"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 1, color: AppColors.primary100),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    color: AppColors.primary900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Change',
                  style: TextStyle(
                    color: AppColors.primary900,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                    Text('925 S Chugach St #APT 10, Alaska 99645',
                      style: TextStyle(color: AppColors.primary500,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Divider(height: 1, color: AppColors.primary100),
            SizedBox(height: 20.h),
            Text(
              'Payment Method',
              style: TextStyle(
                color: AppColors.primary900,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            TabBar(tabs: [
              Tab(
                text: "AJJsk",
                child:Container( width: 100, height: 100,color: Colors.black,)
              ),
              Tab(
                  text: "AJJsk",
                  child:Container( width: 100, height: 100,color: Colors.black,)
              )
            ])


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 31.h, left: 25.w, right: 25.w),
        child: StoreFloatingButton(
          text: "Pleace Order",
          arrow: false,
          callback: () {},
          color: AppColors.primary900,
        ),
      ),
    );
  }
}




