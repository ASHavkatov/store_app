import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';


class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/logout.svg",
            colorFilter: ColorFilter.mode(AppColors.error, BlendMode.srcIn),
          ),
          SizedBox(width: 30.w),
          StoreAppText(
            title: 'Logout',
            color: AppColors.error,
            fontWeight: FontWeight.w400,
            size: 16,
          ),
        ],
      ),
    );
  }
}
