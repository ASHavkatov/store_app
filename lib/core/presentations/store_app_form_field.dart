import 'package:flutter/material.dart';
import 'package:store_app/core/presentations/store_app_text.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreAppFormField extends StatelessWidget {
  const StoreAppFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.fontWeight,
    this.suffix,
    required this.color,
    required this.controller,
    this.size = 16,
  });

  final String title, hintText;
  final FontWeight fontWeight;
  final Widget? suffix;
  final Color color;
  final double size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        StoreAppText(
          title: title,
          color: color,
          fontWeight: fontWeight,
          size: size,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            suffix: suffix,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.primary400, fontSize: 16),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primary100.withValues(alpha: 0.1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
