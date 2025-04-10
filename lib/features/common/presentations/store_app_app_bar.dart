import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_icon_button.dart';

class StoreAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppAppBar({
    super.key,
    this.toolbarHeight = 64,
    required this.title,
  });

  final double toolbarHeight;
  final String title;

  @override
  Size get preferredSize => Size(double.infinity, toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: Align(
          alignment: Alignment.center,
          child: StoreIconButton(
            icon: "assets/icons/back-arrow.svg",
            width: 19.w,
            height: 16.h,
            callback: () => context.pop(),
          ),
        ),
      ),centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primary900,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      toolbarHeight: toolbarHeight.h,
      actions: [Padding(
        padding:  EdgeInsets.only(right: 25.w),
        child: SvgPicture.asset("assets/icons/store_app_big-ben.svg"),
      )],
    );
  }
}
