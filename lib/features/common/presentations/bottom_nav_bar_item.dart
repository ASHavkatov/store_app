import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.svg,
    required this.title,
    required this.color, required this.callback, required this.titleColor,
  });

  final String svg;
  final String title;
  final Color color, titleColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        spacing: 3,
        children: [
          SvgPicture.asset(
            svg,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
