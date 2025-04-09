import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/home_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import '../widgets/home_sliver_app_bar.dart';
import '../widgets/home_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          const HomeSliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(25),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return const HomeItem(title: "Regular Fit Slogan");
                },
                childCount: 6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 20,
                childAspectRatio: 161.w / 230.h,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const StoreBottomNavigationBar(),
    );
  }
}

