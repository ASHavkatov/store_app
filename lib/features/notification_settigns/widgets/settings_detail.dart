

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';


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
            FlutterSwitch(
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
