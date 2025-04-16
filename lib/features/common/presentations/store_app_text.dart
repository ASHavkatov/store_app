import 'package:flutter/material.dart';

class StoreAppText extends StatelessWidget {
  const StoreAppText({
    super.key,
    required this.title,
    required this.color,
    this.size = 18,
    this.fontWeight = FontWeight.w400,
  });

  final String title;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        letterSpacing: 0.2,
      ),
    );
  }
}
