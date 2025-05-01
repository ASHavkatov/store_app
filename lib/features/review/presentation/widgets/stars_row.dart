import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarsRow extends StatelessWidget {
  final num starCount; // can be fractional, e.g. 4.2
  final double iconSize;
  const StarsRow({
    super.key,
    required this.starCount,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = starCount.floor();
    bool showHalfStar = (starCount - fullStars) >= 0.6;

    return Row(
      children: List.generate(5, (index) {
        String iconPath;
        if (index < fullStars) {
          iconPath = "assets/icons/star_filled.svg";
        } else if (index == fullStars && showHalfStar) {
          iconPath = "assets/icons/star_filled.svg"; // Make sure you have this asset
        } else {
          iconPath = "assets/icons/star.svg";
        }

        return Padding(
          padding: const EdgeInsets.only(right: 9),
          child: SvgPicture.asset(
            iconPath,
            width: iconSize,
          ),
        );
      }),
    );
  }
}
