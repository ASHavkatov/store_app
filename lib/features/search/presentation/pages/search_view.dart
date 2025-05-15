import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/store_app_icon_button.dart';
import 'package:store_app/features/search/presentation/blocs/search_bloc.dart';
import 'package:store_app/features/search/presentation/blocs/search_event.dart';
import 'package:store_app/features/search/presentation/blocs/search_state.dart';
import 'package:store_app/features/search/presentation/widgets/search_item.dart';
import 'package:store_app/features/search/presentation/widgets/search_if_empty_result.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';

import '../../../home/presentations/widgets/search_container.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(LoadRecentSearches());
  }

  @override
  Widget build(BuildContext context) {
    String text = "";
    return Scaffold(
      appBar: StoreAppAppBar(title: "Search"),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SearchBloc>().add(LoadRecentSearches());
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SearchContainer(
                    onTextChanged: (text2) {
                      text = text2;
                      context.read<SearchBloc>().add(SearchLoad(title: text2));
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
                            GestureDetector(
                              onTap: () {
                                context.read<SearchBloc>().add(
                                  ClearAllSearches(),
                                );
                              },
                              child: Text(
                                "Clear all",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  fontFamily: "GeneralSans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (state.recentSearches.isEmpty) ...[
                          Text(
                            "No recent searches",
                            style: TextStyle(fontSize: 14),
                          ),
                        ] else ...[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.recentSearches.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.recentSearches[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "GeneralSans",
                                    ),
                                  ),
                                  StoreIconButton(
                                    icon: "assets/icons/cancel.svg",
                                    width: 24,
                                    height: 24,
                                    callback: () {
                                      context.read<SearchBloc>().add(
                                        DeleteText(
                                          state.recentSearches[index] as int,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
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
                        (index) => Container(
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
                              (context, index) => Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.push(
                                        Routes.getDetail(
                                          state.products[index].id,
                                        ),
                                      );
                                      context.read<SearchBloc>().add(
                                        AddRecentSearch(text),
                                      );
                                    },
                                    child: SearchItem(
                                      image: state.products[index].image,
                                      title: state.products[index].title,
                                      discount: state.products[index].discount,
                                      price: state.products[index].price,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Divider(color: Colors.grey),
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
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
