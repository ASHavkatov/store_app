import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class HelpCenterContainer extends StatelessWidget {
  HelpCenterContainer({
    super.key,
    required this.title,
    required this.svg,
    required this.onTab,
  });

  final String title, svg;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.only(left: 24),
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary200),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(svg),
              SizedBox(width: 5.w),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primary900,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}