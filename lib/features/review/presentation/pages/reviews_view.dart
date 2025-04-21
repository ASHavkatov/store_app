import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/review/presentation/widgets/review_item.dart';
import 'package:store_app/features/review/presentation/widgets/rating_bar_section.dart';
import 'package:store_app/features/review/presentation/widgets/stars_row.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  String _selectedSize = 'Most Relevant'; // Declare the selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Reviews"),
      body: ListView(
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
                        CheckoutTitle(title: "4.0", fontSize: 64),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarsRow(starCount: 4, iconSize: 23),
                            Text(
                              "1034 ratings",
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
                      ratingCounts: {5: 2500, 4: 1000, 3: 350, 2: 170, 1: 1670},
                    ),
                  ],
                ),
                Divider(color: AppColors.primary200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckoutTitle(title: "45 Reviews"),
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
                  itemCount: 4,
                  itemBuilder:
                      (context, index) => Column(
                        children: [
                          SizedBox(height: 10),
                          ReviewItem(
                            title:
                                "The item is very good, my son likes it very much and plays every day.",
                            date: 6,
                            stars: 5,
                            userName: "Wade Warren",
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
    );
  }
}
