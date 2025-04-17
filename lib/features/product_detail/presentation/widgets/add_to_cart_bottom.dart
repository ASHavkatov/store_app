import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';

class AddToCartBottom extends StatelessWidget {
  const AddToCartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: AppColors.primary100),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Text(
                  "Price",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "GeneralSans",
                    color: Colors.grey,
                  ),
                ),
                CheckoutTitle(title: "\$1,190", fontSize: 24),
              ],
            ),
            GestureDetector(
              child: Container(
                width: 240.w,
                height: 54.h,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset("assets/icons/bag.svg"),
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
