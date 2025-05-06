import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';

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
                      4,
                      (index) => Container(
                        color: Colors.grey[300],
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 60,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              }
              if (state.status == SearchStatus.success) {
                if (state.products.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: NoSomethingBody(
                      mainText: "No Results Found!",
                      secondaryText:
                          "Try a similar word or something more general.",
                      image: "assets/icons/no_result.svg",
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children:
                          state.products.map((product) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              height: 100,
                              color: Colors.green,
                              child: Center(
                                child: Text(product.title),
                              ), // Example: display product name
                            );
                          }).toList(),
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
