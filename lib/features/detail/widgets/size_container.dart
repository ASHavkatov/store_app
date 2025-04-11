import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 47.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.primary100),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                color: AppColors.primary900,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
