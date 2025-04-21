import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreFloatingButton extends StatelessWidget {
  const StoreFloatingButton({
    super.key,
    required this.text,
    required this.arrow,
    required this.callback,
    this.width = double.infinity,
    this.height = 54,
    required this.color,
    this.textColor = Colors.white
  });

  final String text;

  final bool arrow;

  final VoidCallback callback;

  final double width, height;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 0.1,
              blurRadius: 0.1,
            ),
          ],
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
              ),
            ),
            if (arrow) SvgPicture.asset("assets/icons/arrow-right.svg"),
          ],
        ),
      ),
    );
  }
}
