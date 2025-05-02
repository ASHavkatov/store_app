import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';


class SortByButtons extends StatefulWidget {
  final Function(int) onSelected; // <-- add this

  const SortByButtons({super.key, required this.onSelected});

  @override
  State<SortByButtons> createState() => _SortByButtonsState();
}

class _SortByButtonsState extends State<SortByButtons> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              StoreButtonClickable(
                isSelected: selectedIndex == 0,
                text: "Relevance",
                arrow: false,
                callback: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  widget.onSelected(0); // notify parent
                },
                height: 36.h,
                width: 116.w,
              ),
              SizedBox(width: 8.w),
              StoreButtonClickable(
                isSelected: selectedIndex == 1,
                text: "Price:High-Low",
                arrow: false,
                callback: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.onSelected(1); // notify parent
                },
                height: 36.h,
                width: 163.w,
              ),
              SizedBox(width: 8.w),
              StoreButtonClickable(
                isSelected: selectedIndex == 2,
                text: "Price:Low-High",
                arrow: false,
                callback: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  widget.onSelected(2); // notify parent
                },
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

