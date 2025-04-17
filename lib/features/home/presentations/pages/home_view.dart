import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';
import 'package:store_app/features/home/presentations/widgets/home_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import '../../managers/home_bloc.dart';
import '../../managers/home_state.dart';
import '../widgets/home_sliver_app_bar.dart';
import '../widgets/home_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder:
            (context, state) => switch (state.status) {
              HomeStatus.idle => CustomScrollView(
                slivers: [
                  HomeSliverAppBar(),
                  SliverPadding(
                    padding: const EdgeInsets.all(25),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                         return HomeItem(product: state.products![index]);
                      }, childCount: state.products!.length),
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
              HomeStatus.error => NoSomethingBody(
                mainText: "error",
                secondaryText: "HomeStatus.error",
                image: "assets/icons/search.svg",
              ),
            HomeStatus.loading => Center(child: CircularProgressIndicator()),
              null => throw UnimplementedError(),
            },
      ),
      bottomNavigationBar: const StoreBottomNavigationBar(),
    );
  }
}
