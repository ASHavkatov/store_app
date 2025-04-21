import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarsRow extends StatelessWidget {
  final int starCount; // must be from 1 to 5
  final double iconSize;
  const StarsRow({
    super.key,
    required this.starCount,
    this.iconSize = 18
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 9,
      children: List.generate(5, (index) {
        return SvgPicture.asset(
          index < starCount ? "assets/icons/star_filled.svg" : "assets/icons/star.svg",
          width: iconSize,
        );
      }),
    );
  }
}
