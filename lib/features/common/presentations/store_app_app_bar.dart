import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_icon_button.dart';

import '../../home/presentations/widgets/store_icon_button_container.dart';

class StoreAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppAppBar({
    super.key,
    this.toolbarHeight = 64,
    required this.title,
    this.isTrue = false,
  });

  final double toolbarHeight;
  final String title;
  final bool isTrue;

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
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primary900,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      toolbarHeight: toolbarHeight.h,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () {
              context.push(Routes.notification);
            },
            iconWidth: 24.w,
            iconHeight: 24.h,
          ),
        ),
      ],
      bottom: isTrue ? PreferredSize(
        preferredSize: preferredSize,
        child: Divider(height: 1, color: AppColors.primary100),
      ) : null,
    );
  }
}
