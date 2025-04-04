import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreSignUpContainer extends StatelessWidget {
  const StoreSignUpContainer({
    super.key,
    required this.color,
    required this.title,
    required this.svg,
    required this.fontColor,
  });

  final Color color, fontColor;
  final String title;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary200),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(svg),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
