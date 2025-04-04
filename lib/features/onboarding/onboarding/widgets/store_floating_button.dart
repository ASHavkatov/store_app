import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreFloatingButton extends StatelessWidget {
  const StoreFloatingButton({
    super.key,
    required this.text,
    required this.arrow,
    required this.callback,
    this.width = double.infinity,
    this.height = 54, required this.color,
  });

  final String text;

  final bool arrow;

  final VoidCallback callback;

  final double width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: callback,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "GeneralSans",
                  fontWeight: FontWeight.w500),
            ),
          ),
          if(arrow)
          SvgPicture.asset("assets/icons/arrow-right.svg")
        ],
      ),
    );
  }
}
