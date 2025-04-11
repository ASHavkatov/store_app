import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailMainImage extends StatelessWidget {
  const DetailMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/images/t-shirt.png"),
          width: 341.w,
          height: 368.h,
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Center(child: SvgPicture.asset("assets/icons/heart.svg")),
          ),
        ),
      ],
    );
  }
}
