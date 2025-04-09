import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset("assets/icons/store_app_notification1.svg"),
        Column(
          spacing: 3,
          children: [
            Text(
              "30% Special Discount!",
              style: TextStyle(
                color: AppColors.primary900,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text("Special promotion only valid today.", style: TextStyle(color: AppColors.primary500, fontSize: 12),)
          ],
        ),
      ],
    );
  }
}
