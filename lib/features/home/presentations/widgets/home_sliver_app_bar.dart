import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/data/models/categories/category_model.dart';
import 'package:store_app/features/home/presentations/widgets/home_categories.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';

import '../../managers/home_bloc.dart';
import '../../managers/home_event.dart';
import 'home_filter_box.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 110.h,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: SearchContainer(onTextChanged: (text) {
                context.read<HomeBloc>().add(HomeLoad(title: text, categoryId: null));
              },)),
              SizedBox(width: 8.w),
              HomeFilterBox(),
            ],
          ),
          SizedBox(height: 16.h),
          HomeCategories(categories: categories),
        ],
      ),
    );
  }
}
