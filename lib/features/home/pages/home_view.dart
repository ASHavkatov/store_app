import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/widgets/home_filter_box.dart';
import 'package:store_app/features/home/widgets/search_container.dart';
import 'package:store_app/features/home/widgets/store_icon_button_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 128.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: AppBar(
            leadingWidth: 150.w,
            automaticallyImplyLeading: false,
            leading: Text(
              "Discover",
              style: TextStyle(
                fontSize: 32,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              StoreIconButtonContainer(
                image: "assets/icons/bell.svg",
                callback: () {},
                iconWidth: 24.w,
                iconHeight: 24.h,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 74),
              child: Column(
                children: [
                  Row(
                    spacing: 8.w,
                    children: [
                      SearchContainer(),
                      HomeFilterBox(),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(children: []),
    );
  }
}
