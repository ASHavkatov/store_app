import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/home_categories.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';
import 'package:store_app/features/home/presentations/widgets/store_icon_button_container.dart';

import 'home_filter_box.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(180.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      leadingWidth: 200.w,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Discover",
            style: TextStyle(
              fontSize: 32,
              fontFamily: "GeneralSans",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () {},
            iconWidth: 24.w,
            iconHeight: 24.h,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 120.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: SearchContainer()),
                  SizedBox(width: 8.w),
                  HomeFilterBox(),
                ],
              ),
              SizedBox(height: 10.h),
              HomeCategories( ),
            ],
          ),
        ),
      ),
    );
  }
}
