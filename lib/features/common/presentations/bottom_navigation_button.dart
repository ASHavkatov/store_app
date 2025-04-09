import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationButton extends StatefulWidget {
  const BottomNavigationButton({
    super.key,
    required this.callback,
    required this.text,
    required this.icon,
  });

  final VoidCallback callback;
  final String text;
  final String icon;

  @override
  State<BottomNavigationButton> createState() => _BottomNavigationButtonState();
}

class _BottomNavigationButtonState extends State<BottomNavigationButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: SizedBox(
        height: 47.h,
        child: Column(
          children: [
            SvgPicture.asset(widget.icon),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: "GeneralSans",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
