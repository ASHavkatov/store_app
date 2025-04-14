import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/product_detail/presentation/widgets/detail_item.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailItem(),
            SizedBox(height: 12.h),
            Text(
              "Regular Fit Slogan",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                fontSize: 24,
              ),
            ),
            Row(children: [

            ],)
          ],
        ),
      ),
    );
  }
}