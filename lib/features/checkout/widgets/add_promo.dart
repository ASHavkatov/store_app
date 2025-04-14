import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class AddPromo extends StatelessWidget {
  const AddPromo({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 5),
                child: SvgPicture.asset("assets/icons/promo.svg", colorFilter: ColorFilter.mode(AppColors.primary300, BlendMode.srcIn),),
              ),
              hintText: "Enter promo code",
              hintStyle: TextStyle(color: AppColors.primary400, fontWeight: FontWeight.w400, fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary100, width: 1),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 84.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}