import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/home/managers/home_view_model.dart';
import 'package:store_app/features/home/presentations/widgets/home_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import '../widgets/home_sliver_app_bar.dart';
import '../widgets/home_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();

    return Scaffold(
      appBar: HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          const HomeSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(25),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = vm.products![index];
                return HomeItem(
                  title: vm.products![index].title,
                  price: vm.products![index].price,
                  image: vm.products![index].image,
                );
              }, childCount: vm.products!.length),
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
