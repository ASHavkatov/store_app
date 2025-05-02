import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/data/models/auth_models/rating_calculator.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/review/presentation/widgets/review_item.dart';
import 'package:store_app/features/review/presentation/widgets/rating_bar_section.dart';
import 'package:store_app/features/review/presentation/widgets/stars_row.dart';
import 'package:store_app/core/utils/format_date.dart';

import '../blocs/review_bloc.dart';
import '../blocs/review_state.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key});


  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView>{
  String _selectedSize = 'Most Relevant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Reviews",),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          return switch (state.status) {
            null => throw UnimplementedError(),
            ReviewStatus.loading => Center(child: CircularProgressIndicator()),
            ReviewStatus.error => Center(child: Text("Xatolik bor")),
            ReviewStatus.idle => ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Divider(color: AppColors.primary200),
                      Column(
                        children: [
                          Row(
                            spacing: 16.w,
                            children: [
                              CheckoutTitle(
                                title: "${RatingCalculator(
                                  fiveStars: state.reviewsStars.fiveStars,
                                  fourStars: state.reviewsStars.fourStars,
                                  threeStars: state.reviewsStars.threeStars,
                                  twoStars: state.reviewsStars.twoStars,
                                  oneStar: state.reviewsStars.oneStars,
                                )}",
                                fontSize: 64,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  StarsRow(starCount: RatingCalculator(
                                    fiveStars: state.reviewsStars.fiveStars,
                                    fourStars: state.reviewsStars.fourStars,
                                    threeStars: state.reviewsStars.threeStars,
                                    twoStars: state.reviewsStars.twoStars,
                                    oneStar: state.reviewsStars.oneStars,
                                  ).average
                                      ,iconSize: 23),
                                  Text(
                                    "${state.reviewsStars.totalCount} ratings",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "GeneralSans",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          RatingBarSection(
                            ratingCounts: {
                              5: state.reviewsStars.fiveStars,
                              4: state.reviewsStars.fourStars,
                              3: state.reviewsStars.threeStars,
                              2: state.reviewsStars.twoStars,
                              1: state.reviewsStars.oneStars,
                            },
                          ),
                        ],
                      ),
                      Divider(color: AppColors.primary200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckoutTitle(title: "${state.reviewsStars.totalCount} Reviews"),
                          DropdownButton<String>(
                            value: _selectedSize,
                            items:
                                <String>[
                                  'Most Relevant',
                                  'Least Relevant',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedSize = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.reviewsList.length,
                        itemBuilder:
                            (context, index) => Column(
                              children: [
                                SizedBox(height: 10),
                                ReviewItem(
                                  title: state.reviewsList[index].comment,
                                  date: formatDate((state.reviewsList[index].created).toString()),
                                  stars: 5,
                                  userName:
                                      state.reviewsList[index].userFullName,
                                ),
                                Divider(color: AppColors.primary200),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          };
        },
      ),
    );
  }
}
