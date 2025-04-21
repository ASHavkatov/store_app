import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/no_order.svg",
          width: 64.w,
          height: 64.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 24.h),
        StoreAppText(
          title: "No Ongoing Order!",
          color: AppColors.primary900,
          fontWeight: FontWeight.w600,
          size: 20,
        ),
        SizedBox(height: 12.h),
        StoreAppText(
          title: "You don't have any ongoing orders at this time.",
          color: AppColors.primary500,
          fontWeight: FontWeight.w400,
          size: 16,
        ),
      ],
    );
  }
}
