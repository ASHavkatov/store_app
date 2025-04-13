import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/common/presentations/no_something_body.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/home/presentations/widgets/search_container.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Search"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:24),
        child: Column(
          children: [
            SearchContainer(),
            SizedBox(height: 124.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: NoSomethingBody(
                mainText: "No Results Found!",
                secondaryText: "Try a similar word or something more general.",
                image: "assets/icons/no_result.svg",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
