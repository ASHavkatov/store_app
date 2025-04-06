import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/comman/presentations/store_app_text.dart';

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
    this.validator,
    this.onChanged
  });

  final String? Function(String?)?  validator;
  final void Function(String)? onChanged;

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
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            suffix: suffix,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.primary500, fontSize: 16, ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primary100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
