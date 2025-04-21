import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';

class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({super.key});

  @override
  State<NotificationSettingsView> createState() => _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Notifications", isTrue: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          spacing: 20.h,
          children: [
            SettingsDetail(title: 'General Notifications'),
            SettingsDetail(title: 'Sound'),
            SettingsDetail(title: 'Vibrate'),
            SettingsDetail(title: 'Special Offers'),
            SettingsDetail(title: 'Promo & Discounts'),
            SettingsDetail(title: 'Payments'),
            SettingsDetail(title: 'CahBack'),
            SettingsDetail(title: 'App Updates'),
            SettingsDetail(title: 'New Service Available'),
            SettingsDetail(title: 'New Tips Available'),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}

class SettingsDetail extends StatefulWidget {
  final String title;

  const SettingsDetail({super.key, required this.title});

  @override
  State<SettingsDetail> createState() => _SettingsDetailState();
}

class _SettingsDetailState extends State<SettingsDetail> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.primary900,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            FlutteSwitch(
              width: 45.w,
              height: 21.h,
              borderRadius: 40,
              padding: 2.0,
              activeColor: AppColors.primary900,
              inactiveColor: AppColors.primary100,
              value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Divider(height: 1, color: AppColors.primary200),
      ],
    );
  }
}
