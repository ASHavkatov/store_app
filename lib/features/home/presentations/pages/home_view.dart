import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/managers/home_event.dart';
import 'package:store_app/features/home/presentations/widgets/home_app_bar.dart';

import '../../../../core/routing/routes.dart';
import '../../managers/home_bloc.dart';
import '../../managers/home_state.dart';
import '../widgets/home_item.dart';
import '../widgets/home_sliver_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLoad());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder:
            (context, state) => switch (state.status) {
              HomeStatus.idle => RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(HomeLoad());
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    HomeSliverAppBar(categories: state.categories),
                    SliverPadding(
                      padding: const EdgeInsets.all(25),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.push(Routes.getDetail(state.products![index].id));
                            },
                            child: HomeItem(product: state.products![index]),
                          );
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
