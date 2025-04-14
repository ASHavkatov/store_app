import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class AddNewAddressIcon extends StatelessWidget {
  const AddNewAddressIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: AppColors.primary100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset("assets/icons/plus.svg"),
        SizedBox(width: 10.w),
        Text("Add New Address",style: TextStyle(color: AppColors.primary900,fontWeight: FontWeight.w500,fontSize: 16,),)],
      ),
    );
  }
}
