import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/presentations/bottom_navigation_button.dart';

import '../../../core/routing/routes.dart';

class StoreBottomNavigationBar extends StatelessWidget {
  const StoreBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.2),),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          spacing: 35.w,
          children: [
            BottomNavigationButton(
              callback: () {
                context.push(Routes.home);
              },
              text: "Home",
              icon: "assets/icons/home.svg",
            ),
            BottomNavigationButton(
              callback: () {
                context.push(Routes.search);
              },
              text: "Search",
              icon: "assets/icons/search.svg",
            ),
            BottomNavigationButton(
              callback: () {
                context.push(Routes.saved);
              },
              text: "Saved",
              icon: "assets/icons/saved.svg",
            ),
            BottomNavigationButton(
              callback: () {
                context.push(Routes.myCard);
              },
              text: "Cart",
              icon: "assets/icons/cart.svg",
            ),
            BottomNavigationButton(
              callback: () {
                context.push(Routes.account);
              },
              text: "Account",
              icon: "assets/icons/account.svg",
            ),
          ],
        ),
      ),
    );
  }
}
