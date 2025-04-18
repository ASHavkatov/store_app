import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

class Categories extends StatefulWidget {
  const Categories({super.key,});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int? isSelected;

  List<String> categories = [
    "Generals",
    "Account",
    "Service",
    "Payment"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        spacing: 8,
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: StoreButtonClickable(
              text: categories[index],
              arrow: false,
              callback: () {
                setState(() {
                  isSelected = index;
                });
              },
              isSelected: isSelected == index,
              height: 36,
              width: 99,
            ),

          );
        }
    )
    ,
    )
    ,
    );
  }
  }
