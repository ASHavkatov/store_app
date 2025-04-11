import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/detail/widgets/detail_nav_bar.dart';
import 'package:store_app/features/detail/widgets/rating_row.dart';
import 'package:store_app/features/detail/widgets/size_container.dart';

import '../widgets/detail_main_image.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Details"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          DetailMainImage(),
          SizedBox(height: 12.h),
          StoreAppText(
            title: "Regular Fit Slogan",
            color: AppColors.primary900,
            fontWeight: FontWeight.w600,
            size: 24,
          ),
          SizedBox(height: 13.h),
          RatingRow(),
          SizedBox(height: 13.h),
          StoreAppText(
            title:
                "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.",
            color: AppColors.primary500,
            fontWeight: FontWeight.w400,
            size: 16,
          ),
          SizedBox(height: 12.h),
          StoreAppText(title: "Choose size", color: AppColors.primary900,fontWeight: FontWeight.w600,size: 20,),
          SizedBox(height: 12.h),
          Row(
            children: [
              SizeContainer(size: "S",),
              SizeContainer(size: "M",),
              SizeContainer(size: "L",),
            ],
          )
        ],
      ),
      bottomNavigationBar: DetailNavBar(),
    );
  }
}
