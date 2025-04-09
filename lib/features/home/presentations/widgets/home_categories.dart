import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
  });

  @override
  State<HomeCategories> createState() =>
      _HomeCategoriesState();
}

class _HomeCategoriesState
    extends State<HomeCategories> {
  String selected = "All";

  void updateSelected(String newSelection) {
    setState(() {
      selected = newSelection;
    });
  }

  final categories = ["All", "T-shirt", "Jeans", "Shoes", "Hoodies", "Long-Sleeve"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
        categories.map((text) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: StoreButtonClickable(
              height: 36.h,
              text: text,
              arrow: false,
              callback: () => updateSelected(text),
              activeColor:
              selected == text ? Colors.black : Colors.white,
              inactiveColor:
              selected == text ? Colors.black : Colors.white,
              activeTextColor:
              selected == text ? Colors.white : Colors.black,
              inactiveTextColor:
              selected == text ? Colors.white : Colors.black,
            ),
          );
        }).toList(),
      ),
    );
  }
}