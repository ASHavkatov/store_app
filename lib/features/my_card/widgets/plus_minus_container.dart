import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class PlusMinusContainer extends StatelessWidget {
  const PlusMinusContainer({
    super.key,
    required this.svg,
    required this.callback,
  });

  final String svg;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 23.w,
        height: 23.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary200),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(child: SvgPicture.asset(svg)),
      ),
    );
  }
}