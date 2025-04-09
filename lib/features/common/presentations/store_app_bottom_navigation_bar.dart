import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../../core/routing/routes.dart';
import 'bottom_nav_bar_item.dart';

class StoreAppBottomNavigationBar extends StatelessWidget {
  const StoreAppBottomNavigationBar({super.key, required this.value, required this.selectedIndex});


  final ValueChanged <int> value;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 86.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              title: "Home",
              svg: "assets/icons/store_app_home.svg",
              color: selectedIndex == 0 ? AppColors.primary900 : AppColors.primary300,
              callback: ()=> value(0),
              titleColor: selectedIndex == 0 ? AppColors.primary900 : AppColors.primary300,
            ),
            BottomNavBarItem(
              title: "Search",
              svg: "assets/icons/store_app_search.svg",
              color: selectedIndex == 1 ? AppColors.primary900 : AppColors.primary300,
              callback: ()=> value(1),
              titleColor: selectedIndex == 1 ? AppColors.primary900 : AppColors.primary300,
            ),
            BottomNavBarItem(
              title: "Saved",
              svg: "assets/icons/store_app_heart.svg",
              color: selectedIndex == 2 ? AppColors.primary900 : AppColors.primary300,
              callback: ()=> value(2),
              titleColor: selectedIndex == 2 ? AppColors.primary900 : AppColors.primary300,
            ),
            BottomNavBarItem(
              title: "Cart",
              svg: "assets/icons/store_app_cart.svg",
              color: selectedIndex == 3 ? AppColors.primary900 : AppColors.primary300,
              callback: ()=> value(3),
              titleColor: selectedIndex == 3 ? AppColors.primary900 : AppColors.primary300,
            ),
            BottomNavBarItem(
              title: "Account",
              svg: "assets/icons/store_app_account.svg",
              color: selectedIndex == 4 ? AppColors.primary900 : AppColors.primary300,
              callback: ()=> value(4),
              titleColor: selectedIndex == 4 ? AppColors.primary900 : AppColors.primary300,
            ),
          ],
        ),
      ),
    );
  }
}
