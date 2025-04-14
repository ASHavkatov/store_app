import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetText extends StatelessWidget {
  const ForgetText({super.key, required this.title, required this.text});
  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "GeneralSans",
          fontSize: 32,
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        text,
        style: TextStyle(
          fontFamily: "GeneralSans",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    ],);
  }
}
