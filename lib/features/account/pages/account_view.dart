  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_svg/flutter_svg.dart';
  import 'package:go_router/go_router.dart';
  import 'package:store_app/core/client.dart';
  import 'package:store_app/core/utils/colors.dart';
  import 'package:store_app/data/repositories/auth_repositories_models/auth_repository.dart';
  import 'package:store_app/features/checkout/widgets/checkout_title.dart';
  import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
  import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
  import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

  import '../../../core/routing/routes.dart';
  import '../widgets/logout_container.dart';
  import '../widgets/main_container.dart';

  class AccountView extends StatelessWidget {
     AccountView({super.key});
   final AuthRepository _repo = AuthRepository(client: ApiClient());

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
                onTap: () => context.push(Routes.myOrders),
              ),
            ),
            Divider(color: AppColors.primary100, thickness: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MainContainer(
                svg: 'assets/icons/detail.svg',
                title: "My Details",
                onTap: () => context.push(Routes.myDetails),
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
                onTap: () => context.push(Routes.notificationSettings),
              ),
            ),
            Divider(color: AppColors.primary100, thickness: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MainContainer(
                svg: 'assets/icons/questions_mark.svg',
                title: "FAQs",
                onTap: () => context.push(Routes.faqs),
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
                onTap: () => context.push(Routes.notification),
              ),
            ),
            Divider(color: AppColors.primary100, thickness: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.transparent,
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 341.w,
                            height: 336.h,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/warning.svg',
                                  width: 63.w,
                                  height: 63.h,
                                ),
                                SizedBox(height: 12.h),
                                CheckoutTitle(title: "Logout?"),
                                SizedBox(height: 8.h),
                                Text(
                                  "Are you sure you want to logout?",
                                  style: TextStyle(
                                    color: AppColors.primary500,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 24.h),
                                StoreFloatingButton(
                                  text: "Yes, Logout",
                                  arrow: false,
                                  callback: () async{
                                    try {
                                      await _repo.logout();
                                      context.go(Routes.login);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Logout failed: ${e.toString()}")),
                                      );
                                    }
                                  },
                                  color: AppColors.error,
                                ),
                                SizedBox(height: 10.h),
                                StoreFloatingButton(
                                  text: "No, Cancel",
                                  arrow: false,
                                  callback: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.white,
                                  textColor: AppColors.primary900,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: LogoutContainer(),
              ),
            ),

          ],
        ),
        bottomNavigationBar: StoreBottomNavigationBar(),
      );
    }
  }
