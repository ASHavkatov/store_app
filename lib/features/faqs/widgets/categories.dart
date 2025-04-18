import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

class Categories extends StatefulWidget {
  const Categories({super.key,});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
int? isSelected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          StoreButtonClickable(
            text: "Generals",
            arrow: false,
            callback: () {
                  () => setState(() {
                isSelected = null;
              });
            },
            isSelected: isSelected == null,
            height: 36,
            width: 99,
          ),
          StoreButtonClickable(
            text: "Account",
            arrow: false,
            callback: () {
                  () => setState(() {
                isSelected = null;
              });
            },
            isSelected: isSelected == null,
            height: 36,
            width: 99,
          ),StoreButtonClickable(
            text: "Service",
            arrow: false,
            callback: () {
                  () => setState(() {
                isSelected = null;
              });
            },
            isSelected: isSelected == null,
            height: 36,
            width: 99,
          ),StoreButtonClickable(
            text: "Payment",
            arrow: false,
            callback: () {
                  () => setState(() {
                isSelected = null;
              });
            },
            isSelected: isSelected == null,
            height: 36,
            width: 99,
          ),
        ],
      ),
    );
  }
}
