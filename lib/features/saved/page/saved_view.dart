import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Saved Items", isTrue: true),
      body: SavedDetail(),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}

class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              width: 161.w,
              height: 122.h,
              "assets/images/t-shirt.png",
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 12,
              right: 13,
              child: Container(
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/like.svg',colorFilter: ColorFilter.mode(AppColors.primaryRed, BlendMode.srcIn),),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

      ],
    );
  }
}
