import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class NoSomethingBody extends StatelessWidget {
  const NoSomethingBody({
    super.key,
    required this.mainText,
    required this.secondaryText,
    required this.image,
  });

  final String image;
  final String mainText, secondaryText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          width: 64.w,
          height: 64.h,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(AppColors.primary300, BlendMode.srcIn),
        ),
        SizedBox(height: 24.h),
        Text(
          mainText,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            color: AppColors.primary900,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          maxLines: 2,
          secondaryText,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.primary500, fontSize: 16),
        ),
      ],
    );
  }
}
