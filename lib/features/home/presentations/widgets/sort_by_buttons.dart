import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

class SortByButtons extends StatelessWidget {
  const SortByButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            spacing: 8.w,
            children: [
              StoreButtonClickable(
                isSelected: false,
                text: "Relevance",
                arrow: false,
                callback: () {},
                height: 36.h,
                width: 116.w,
              ),
              StoreButtonClickable(
                isSelected: false,
                text: "Price:High-Low",
                arrow: false,
                callback: () {},
                height: 36.h,
                width: 163.w,
              ),
              StoreButtonClickable(
                isSelected: false,
                text: "Price:Low-High",
                arrow: false,
                callback: () {},
                height: 36.h,
                width: 163.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}