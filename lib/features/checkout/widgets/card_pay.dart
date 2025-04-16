import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class CardPay extends StatelessWidget {
  const CardPay({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      width: 341.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/visa.svg"),
          SizedBox(width: 8),
          Text(
            " **** **** **** 2512",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(width: 77.w),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset("assets/icons/edit.svg"),
          ),
        ],
      ),
    );
  }
}