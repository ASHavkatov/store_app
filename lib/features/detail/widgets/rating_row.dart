import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: [
        SvgPicture.asset("assets/icons/star_filled.svg"),
        Text.rich(
          TextSpan(
            text: "4.0/5",
            style: TextStyle(
              color: AppColors.primary900,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "(45 reviews)",
                style: TextStyle(
                  color: AppColors.primary300,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
