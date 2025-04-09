import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/home/presentations/pages/bottom_navigation_button.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          mainAxisSpacing: 20,
          childAspectRatio: 161.w / 230.h,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const HomeItem(title: "Regular Fit Slogan");
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 88.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            vertical: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            spacing: 35.w,
            children: [
              BottomNavigationButton(
                callback: () {
                  context.go(Routes.home);
                },
                text: "Home",
                icon: "assets/icons/home.svg",
              ),
              BottomNavigationButton(
                callback: () {
                  context.go(Routes.home);
                },
                text: "Search",
                icon: "assets/icons/search.svg",
              ),
              BottomNavigationButton(
                callback: () {
                  context.go(Routes.home);
                },
                text: "Saved",
                icon: "assets/icons/saved.svg",
              ),
              BottomNavigationButton(
                callback: () {
                  context.go(Routes.home);
                },
                text: "Cart",
                icon: "assets/icons/cart.svg",
              ),
              BottomNavigationButton(
                callback: () {
                  context.go(Routes.home);
                },
                text: "Account",
                icon: "assets/icons/account.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
