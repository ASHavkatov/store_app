import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../../core/utils/colors.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(Routes.newCard);
      },
      child: Container(
        width: double.infinity,
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.primary100),
        ),
        child: Center(
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/plus.svg"),
              Text(
                "Add New Card ",
                style: TextStyle(color: AppColors.primary900, fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
