import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/home/presentations/widgets/store_icon_button_container.dart';

import '../../../../core/routing/routes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  
 Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: AppBar(
        leadingWidth: 180.w,
        leading: Text(
          "Discover",
          style: TextStyle(
            fontSize: 32,
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          StoreIconButtonContainer(
            image: "assets/icons/notification.svg",
            callback: () {
              context.push(Routes.notification);
            },
            iconWidth: 24.w,
            iconHeight: 24.h,
          ),
        ],
      ),
    );
  }
}

