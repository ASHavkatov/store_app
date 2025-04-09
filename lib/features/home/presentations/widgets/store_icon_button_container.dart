import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class StoreIconButtonContainer extends StatelessWidget {
  const StoreIconButtonContainer({
    super.key,
    required this.image,
    required this.callback,
    this.containerWidth = 28,
    this.containerHeight = 28,
    required this.iconWidth,
    required this.iconHeight,
    this.iconColor = Colors.black,
    this.containerColor = Colors.white
  });

  final String image;
  final VoidCallback callback;
  final double containerWidth, containerHeight;
  final double iconWidth, iconHeight;

  final Color iconColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(containerWidth / 2),
      ),
      child: IconButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          image,
          width: iconWidth,
          height: iconHeight,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
