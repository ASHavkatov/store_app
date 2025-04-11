import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class DetailNavBar extends StatelessWidget {
  const DetailNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.w,
        top: 20.h,
        right: 25.w,
        bottom: 25.h,
      ),
      width: 390.w,
      height: 105.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: AppColors.primary100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // textAlign: TextAlign.start,
                "Price",
                style: TextStyle(color: AppColors.primary500, fontSize: 16),
              ),
              SizedBox(height: 3),
              Text(
                // textAlign: TextAlign.start,
                "\$1,190",
                style: TextStyle(
                  color: AppColors.primary900,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 30.w),
          Container(
            width: 240.w,
            height: 54.h,
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/shop.svg",
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
