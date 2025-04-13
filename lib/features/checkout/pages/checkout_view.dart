// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:store_app/core/utils/colors.dart';
// import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
// import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';
//
// class CheckoutView extends StatefulWidget {
//   const CheckoutView({super.key});
//
//   @override
//   State<CheckoutView> createState() => _CheckoutViewState();
// }
//
// class _CheckoutViewState extends State<CheckoutView> with SingleTickerProviderStateMixin{
//   late TabController controller;
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: StoreAppAppBar(title: "Checkout"),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Divider(height: 1, color: AppColors.primary100),
//             SizedBox(height: 20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Delivery Address',
//                   style: TextStyle(
//                     color: AppColors.primary900,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   'Change',
//                   style: TextStyle(
//                     color: AppColors.primary900,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.h),
//             Row(
//               children: [
//                 SvgPicture.asset("assets/icons/map_pin.svg"),
//                 SizedBox(width: 8.w),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   spacing: 4,
//                   children: [
//                     Text(
//                       'Home',
//                       style: TextStyle(
//                         color: AppColors.primary900,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(
//                       '925 S Chugach St #APT 10, Alaska 99645',
//                       style: TextStyle(
//                         color: AppColors.primary500,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20.h),
//             Divider(height: 1, color: AppColors.primary100),
//             SizedBox(height: 20.h),
//             Text(
//               'Payment Method',
//               style: TextStyle(
//                 color: AppColors.primary900,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(height: 16.h),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(bottom: 31.h, left: 25.w, right: 25.w),
//         child: StoreFloatingButton(
//           text: "Pleace Order",
//           arrow: false,
//           callback: () {},
//           color: AppColors.primary900,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this); // TabBar uchun controller
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            Text(
              'Payment Method',
              style: TextStyle(
                color: AppColors.primary900,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            TabBar(
              controller: controller,
              indicatorColor: AppColors.primary900,
              tabs: [
                Tab(text: 'Credit Card'),
                Tab(text: 'PayPal'),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              height: 200.h,
              child: TabBarView(
                controller: controller,
                children: [
                  // Credit Card bo'limi
                  Center(
                    child: Text(
                      'Credit Card payment details here...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary900,
                      ),
                    ),
                  ),
                  // PayPal bo'limi
                  Center(
                    child: Text(
                      'PayPal payment details here...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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


