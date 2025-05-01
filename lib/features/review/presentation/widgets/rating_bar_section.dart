import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class RatingBarSection extends StatefulWidget {
  final Map<int, int> ratingCounts;

  const RatingBarSection({super.key, required this.ratingCounts});

  @override
  State<RatingBarSection> createState() => _RatingBarSectionState();
}

class _RatingBarSectionState extends State<RatingBarSection> {
  Map<int, double> animatedPercentages = {};

  @override
  void initState() {
    super.initState();

    final totalVotes = widget.ratingCounts.values.fold(0, (a, b) => a + b);

    Map<int, double> ratingPercentages = {
      for (var entry in widget.ratingCounts.entries)
        entry.key: totalVotes == 0 ? 0 : entry.value / totalVotes
    };

    // Trigger animation after slight delay
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        animatedPercentages = ratingPercentages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) {
        int star = 5 - index;
        double percent = animatedPercentages[star] ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              Row(
                children: List.generate(5, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: SvgPicture.asset(
                      i < star
                          ? "assets/icons/star_filled.svg"
                          : "assets/icons/star.svg",
                      width: 16,
                    ),
                  );
                }),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                    tween: Tween<double>(begin: 0, end: percent),
                    builder: (context, value, child) {
                      return FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
