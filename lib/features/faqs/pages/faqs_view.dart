import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/faqs/widgets/categories.dart';
import 'package:store_app/features/faqs/widgets/expanded_container.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  List<Widget> generalItems = [
    ExpandedContainer(
      title: "How do I make a purchase?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
    ExpandedContainer(
      title: "What payment methods are accepted?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
    ExpandedContainer(
      title: "How do I track my orders?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
    ExpandedContainer(
      title: "Can I cancel or return an order?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
    ExpandedContainer(
      title: "How can I contact customer support for assistance?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
    ExpandedContainer(
      title: "How do I create an account?",
      subtitle:
          "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the 'Add to Cart ' button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "FAQs"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Divider(color: AppColors.primary100, height: 1),
          SizedBox(height: 24.h),
          Categories(),
          SizedBox(height: 16.h),
          SearchContainer(),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: generalItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [generalItems[index], SizedBox(height: 14.h)],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
