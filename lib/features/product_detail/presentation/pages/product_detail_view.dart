import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';
import 'package:store_app/features/product_detail/presentation/widgets/detail_item.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {

  String selected = "S";

  void updateSelected(String newSelection) {
    setState(() {
      selected = newSelection;
    });
  }

  final categories = ["S","M","L"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailItem(),
            SizedBox(height: 13.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 13.h,
              children: [
                CheckoutTitle(title: "Regular Fit Slogan", fontSize: 24),
                SizedBox(
                  height: 22.h,
                  child: Row(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/icons/star_filled.svg"),
                      Text(
                        "4.0/5",
                        style: TextStyle(
                          fontFamily: "GeneralSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Text(
                        "(45 reviews)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "GeneralSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "The name says it all, the right size slightly snugs the"
                  "body leaving enough room for comfort in the sleeves and waist.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "GeneralSans",
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            CheckoutTitle(title: "Choose size", fontSize: 24),
            SizedBox(height: 12.h,),
            Row(
              children:
              categories.map((text) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: StoreButtonClickable(
                    height: 36.h,
                    text: text,
                    arrow: false,
                    callback: () => updateSelected(text),
                    activeColor:
                    selected == text ? Colors.black : Colors.white,
                    inactiveColor:
                    selected == text ? Colors.black : Colors.white,
                    activeTextColor:
                    selected == text ? Colors.white : Colors.black,
                    inactiveTextColor:
                    selected == text ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
