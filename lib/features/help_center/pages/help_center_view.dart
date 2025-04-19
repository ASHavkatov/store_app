import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';

import '../widgets/help_center_container.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Help Center", isTrue: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(spacing: 14.h, children: [
          HelpCenterContainer(title: "Customer Service", svg: "assets/icons/headphones.svg", onTab: (){}),
          HelpCenterContainer(title: "Whatsapp", svg: "assets/icons/whatsapp.svg", onTab: (){}),
          HelpCenterContainer(title: "Website", svg: "assets/icons/website.svg", onTab: (){}),
          HelpCenterContainer(title: "Facebook", svg: "assets/icons/facebook.svg", onTab: (){}),
          HelpCenterContainer(title: "Twitter", svg: "assets/icons/twitter.svg", onTab: (){}),
          HelpCenterContainer(title: "Instagram", svg: "assets/icons/instagram.svg", onTab: (){}),
        ]),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}


