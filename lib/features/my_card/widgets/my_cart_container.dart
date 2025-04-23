import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/my_card/widgets/plus_minus_container.dart';

import '../../../core/utils/colors.dart';
import '../../checkout/widgets/checkout_title.dart';
import '../../common/presentations/store_app_icon_button.dart';

class MyCartContainer extends StatelessWidget {
  const MyCartContainer({
    super.key,
    required this.image,
    required this.title,
    required this.callback,
    required this.clothsize,
    required this.price,
    required this.callbackminus,
    required this.callbackplus,
  });

  final String image, title, clothsize, price;
  final VoidCallback callback, callbackminus, callbackplus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 342.w,
          height: 107.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.primary100),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    image,
                    width: 83.w,
                    height: 79.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckoutTitle(title: title),
                        StoreIconButton(
                          icon: "assets/icons/trash.svg",
                          width: 15.w,
                          height: 15.h,
                          callback: callback,
                        ),
                      ],
                    ),
                    Text(
                      clothsize,
                      style: TextStyle(
                        height: 1,
                        color: AppColors.primary900.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckoutTitle(title: price),
                        SizedBox(width: 95.w),
                        PlusMinusContainer(
                          svg: 'assets/icons/plus.svg',
                          callback: callbackminus,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        PlusMinusContainer(
                            svg: 'assets/icons/plus.svg',
                            callback: callbackplus
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}