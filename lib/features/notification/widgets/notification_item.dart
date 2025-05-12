import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.text, required this.desc, required this.svg});

  final String text;
  final String desc, svg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 39.h,
          width: 224.w,
          child: Row(
            children: [
              SvgPicture.network(svg),
              SizedBox(width: 7.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: TextStyle(color: AppColors.primary900,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SizedBox(height: 2.h),
                  Text(text, style: TextStyle(color: AppColors.primary500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,),),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Divider(color: AppColors.primary500,)
      ],
    );
  }
}