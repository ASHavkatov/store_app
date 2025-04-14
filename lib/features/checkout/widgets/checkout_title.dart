import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
class CheckoutTitle extends StatelessWidget {
  const CheckoutTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        color: AppColors.primary900,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
