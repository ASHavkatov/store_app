import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResetPasswordAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 52);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AppBar(
        leading: Center(
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset('assets/icons/back-arrow.svg'),
          ),
        ),
      ),
    );
  }
}
