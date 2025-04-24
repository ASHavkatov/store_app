import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/review/presentation/widgets/stars_row.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key,required this.title,required this.userName,required this.date,required this.stars});

  final String title,userName;
  final int stars;
  final num date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Column(
        spacing: 12,
        children: [
          StarsRow(starCount: stars),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primary400,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: "GeneralSans",
            ),
          ),
          Row(
            children: [
              CheckoutTitle(title: userName),
              Text("•", style: TextStyle(color: Colors.grey)),
              Text(
                "$date days ago",
                style: TextStyle(
                  color: AppColors.primary400,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: "GeneralSans",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
