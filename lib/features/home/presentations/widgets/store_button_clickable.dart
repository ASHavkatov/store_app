import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreButtonClickable extends StatelessWidget {
  const StoreButtonClickable({
    super.key,
    required this.text,
    required this.arrow,
    required this.callback,
    this.width = double.infinity,
    this.height = 54,
    required this.isSelected,
  });

  final String text;
  final bool arrow;
  final VoidCallback callback;
  final double width, height;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: height,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.primary100 : Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
