import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreAppFormField extends StatefulWidget {
   StoreAppFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.validator,
    required this.isValid,
     this.autoValidateMode = AutovalidateMode.onUnfocus, required this.fontWeight, required this.color, required this.size,  this.svg = "assets/icons/store_app_hide.svg"

  });

  final TextEditingController controller;
  final String title, hintText;
  final String? Function(String?) validator;
  final FontWeight fontWeight;
  final Color color;
  final bool? isValid;
  final AutovalidateMode autoValidateMode;
  final double size;
  final String svg;

  @override
  State<StoreAppFormField> createState() => _StoreAppFormFieldState();
}

class _StoreAppFormFieldState extends State<StoreAppFormField> {
  // bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: widget.color,
            fontSize: 16.r,
            fontWeight: widget.fontWeight,
          ),
        ),
        TextFormField(
          // obscureText: obscureText,
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: widget.autoValidateMode,
          style: TextStyle(
            color: AppColors.primary900,
            fontSize: 16.r,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            // suffix: GestureDetector(onTap: (){
            //   setState(() {
            //     obscureText != obscureText;
            //   });
            // },child: SvgPicture.asset(widget.svg)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            hintStyle: TextStyle(color: AppColors.primary500, fontSize: 16.r),
            errorStyle: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.w500,
            ),
            suffixIconConstraints: BoxConstraints.loose(
              Size(double.infinity, double.infinity),
            ),
            suffixIcon: Visibility.maintain(
              visible: widget.isValid != null ? true : false,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: SvgPicture.asset(
                  "assets/icons/store_app_validation_${widget.isValid != null && widget.isValid! ? 'success' : 'error'}.svg",

                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            hintText: widget.hintText,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color:
                widget.isValid != null && widget.isValid!
                    ? AppColors.successGreen
                    : AppColors.primary500,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color:
                widget.isValid != null && widget.isValid!
                    ? AppColors.successGreen
                    : AppColors.primary500,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
