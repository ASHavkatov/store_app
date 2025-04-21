import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class RatingBarSection extends StatelessWidget {
  final Map<int, int> ratingCounts;

  const RatingBarSection({super.key, required this.ratingCounts});

  @override
  Widget build(BuildContext context) {
    int totalVotes = ratingCounts.values.reduce((a, b) => a + b);

    Map<int, double> ratingPercentages = {
      for (var entry in ratingCounts.entries)
        entry.key: entry.value / totalVotes
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        int star = 5 - index;
        double percent = ratingPercentages[star] ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            spacing: 12,
            children: [
              Row(
                spacing: 6,
                children: List.generate(5, (i) {
                  return SvgPicture.asset(
                    i < star ? "assets/icons/star_filled.svg" : "assets/icons/star.svg", width: 16,
                  );
                }),
              ),
              // Progress bar
              Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              // Star icons based on rating level (5 to 1)
            ],
          ),
        );
      }),
    );
  }
}
