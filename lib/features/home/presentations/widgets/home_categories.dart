import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

import '../../managers/home_bloc.dart';
import '../../managers/home_event.dart';

class HomeCategories extends StatefulWidget {
  final List<CategoryModel> categories;

  const HomeCategories({super.key, required this.categories});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: StoreButtonClickable(
              height: 36.h,
              text: "All",
              arrow: false,
              callback:
                  () => setState(() {
                    selectedId = null;
                    context.read<HomeBloc>().add(HomeLoad());
                  }),
              isSelected: selectedId == null,
            ),
          ),
          for (var category in widget.categories)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: StoreButtonClickable(
                height: 36.h,
                text: category.title,
                arrow: false,
                callback:
                    () => setState(() {
                      selectedId = category.id;
                      context.read<HomeBloc>().add(
                        HomeLoad(categoryId: category.id),
                      );
                    }),
                isSelected: selectedId == category.id,
              ),
            ),
        ],
      ),
    );
  }
}
