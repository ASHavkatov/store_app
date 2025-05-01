import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
// ignore: must_be_immutable
class CheckoutTitle extends StatelessWidget {
  CheckoutTitle({super.key, required this.title,this.fontSize=16,this.fontWeight=FontWeight.w600});
  final String title;
  double fontSize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        color: AppColors.primary900,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
