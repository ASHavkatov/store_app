import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key,required this.title, required this.summary});

  final title, summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primary400,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          summary,
          style: TextStyle(
            color: AppColors.primary900,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
