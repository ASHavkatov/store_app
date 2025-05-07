import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';
import 'package:store_app/features/search/presentation/widgets/search_if_empty_result.dart';
import 'package:store_app/features/search/presentation/widgets/search_item.dart';

import '../../../../core/routing/routes.dart';
import '../blocs/search_bloc.dart';
import '../blocs/search_event.dart';
import '../blocs/search_state.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Search"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SearchContainer(
                  onTextChanged: (text) {
                    context.read<SearchBloc>().add(SearchLoad(title: text));
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.status == SearchStatus.idle) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CheckoutTitle(title: "Recently Searched"),
                          Text(
                            "Clear all",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontFamily: "GeneralSans",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              if (state.status == SearchStatus.loading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: List.generate(
                      state.products.length,
                          (index) =>
                          Container(
                            color: Colors.grey[300],
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 53.h,
                            width: double.infinity,
                          ),
                    ),
                  ),
                );
              }
              if (state.status == SearchStatus.success) {
                if (state.products.isEmpty) {
                  return SearchIfEmptyResult();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: 600.h,
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder:
                            (context, index) =>
                            Column(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    context.push(Routes.getDetail(state.products[index].id));
                                    },
                                  child: SearchItem(image: state.products[index].image,
                                      title: state.products[index].title,
                                      discount: state.products[index].discount,
                                      price: state.products[index].price),
                                ),
                                SizedBox(height: 20.h),
                                Divider(color: AppColors.primary100),
                                SizedBox(height: 20.h),
                              ],
                            ),
                      ),
                    ),
                  );
                }
              }
              if (state.status == SearchStatus.error) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 46),
                  child: NoSomethingBody(
                    mainText: "Something went wrong!",
                    secondaryText: "Please try again.",
                    image: "assets/icons/no_result.svg",
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
