import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';

import '../../../core/routing/routes.dart';
import '../widgets/logout_container.dart';
import '../widgets/main_container.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Account"),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.primary100, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              title: 'My Orders',
              svg: "assets/icons/order.svg",
              onTap: () => context.go(Routes.myOrders),
            ),
          ),
          Divider(color: AppColors.primary100, thickness: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/detail.svg',
              title: "My Details",
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.primary100, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/underline_home.svg',
              title: "Address Book",
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.primary100, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/card.svg',
              title: "Payment Method",
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.primary100, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/notification.svg',
              title: "Notification",
              onTap: () => context.go(Routes.notification),
            ),
          ),
          Divider(color: AppColors.primary100, thickness: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/questions_mark.svg',
              title: "FAQs",
              onTap: () => context.go(Routes.notification),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(color: AppColors.primary100, height: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MainContainer(
              svg: 'assets/icons/headphones.svg',
              title: "Help Center",
              onTap: () => context.go(Routes.notification),
            ),
          ),
          Divider(color: AppColors.primary100, thickness: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(onTap: ()=> context.go(Routes.home),child: LogoutContainer()),
          )
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
