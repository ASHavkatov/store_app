import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class CashPay extends StatefulWidget {
  CashPay({super.key});

  @override
  State<CashPay> createState() => _CashPayState();
}

class _CashPayState extends State<CashPay> {
  bool isSelect= true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      width: 341.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/cash.svg"),
          SizedBox(width: 8),
          Text(
            "Buyurtmani olganda to'lov qilish",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          SizedBox(width: 40.w),
          GestureDetector(
            onTap: (){
              setState(() {
                isSelect = !isSelect;
              });
            },
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary900, width: 2),
              ),
              child: isSelect ? SvgPicture.asset(
                alignment: Alignment.center,
                "assets/icons/true.svg",
              ) : null,
            ),
          ),
        ],
      ),
    );
  }
}
