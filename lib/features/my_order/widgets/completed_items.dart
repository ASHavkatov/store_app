import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';

class CompletedItems extends StatelessWidget {
  const CompletedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary100),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage("assets/images/t-shirt.png"),
              width: 83.w,
              height: 79.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreAppText(
                title: "Regular Fit Slogan",
                color: AppColors.primary900,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 2.h),
              StoreAppText(
                title: "Size M",
                color: AppColors.primary500,
                size: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20),
              StoreAppText(
                title: "\$1,190",
                color: AppColors.primary900,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          // SizedBox(width: 20),
          Column(
            children: [
              Container(
                height: 20.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.completedContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: AppColors.successGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 27),
              Container(
                height: 30.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: AppColors.primary900,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Leave Review",
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
