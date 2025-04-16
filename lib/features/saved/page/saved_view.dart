import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/presentations/widgets/home_item.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Saved Items", isTrue: true),
      body: GridView.builder(
        padding: EdgeInsets.only(right: 24.w,left: 24.w, ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          childAspectRatio: 161.w / 230.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return SavedDetail();
        },
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}

class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      height: 122.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/t-shirt.png",
                  width: 161.w,
                  height: 122.h,
                  fit: BoxFit.cover,
                ),
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
                    child: SvgPicture.asset(
                      'assets/icons/like.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryRed,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CheckoutTitle(
            title: "Regular Fit Slogan",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 3.h),
          Text(
            "\$1.1111",
            style: TextStyle(
              fontFamily: "GeneralSans",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
