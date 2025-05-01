class RatingCalculator {
  final int fiveStars;
  final int fourStars;
  final int threeStars;
  final int twoStars;
  final int oneStar;

  RatingCalculator({
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStar,
  });

  int get totalCount =>
      fiveStars + fourStars + threeStars + twoStars + oneStar;

  double get average {
    if (totalCount == 0) return 0;
    final totalScore = (5 * fiveStars) +
        (4 * fourStars) +
        (3 * threeStars) +
        (2 * twoStars) +
        (1 * oneStar);
    return totalScore / totalCount;
  }

  @override
  String toString() => average.toStringAsFixed(1);
}
