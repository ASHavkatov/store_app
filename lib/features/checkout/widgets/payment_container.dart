import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class PaymentContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String svg, text;
  final bool isSelected;

  const PaymentContainer({
    super.key,
    required this.onTap,
    required this.svg,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary900 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.white: AppColors.primary900,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : AppColors.primary900,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.primary900,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}