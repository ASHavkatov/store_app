import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';


class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.svg,
    required this.title,
    required this.onTap,
  });

  final String svg;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 68.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(svg),
            // SizedBox(width: 16.w),
            StoreAppText(
              title: title,
              color: AppColors.primary900,
              fontWeight: FontWeight.w400,
              size: 16,
            ),
            SizedBox(width: 150.w),
            SvgPicture.asset("assets/icons/arrow-right.svg"),
          ],
        ),
      ),
    );
  }
}
