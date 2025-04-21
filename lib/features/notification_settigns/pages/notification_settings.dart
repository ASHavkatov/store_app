import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';

import '../widgets/settings_detail.dart';

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

