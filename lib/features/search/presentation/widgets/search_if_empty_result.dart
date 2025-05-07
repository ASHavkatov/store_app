import 'package:flutter/material.dart';

import '../../../common/presentations/no_something_body.dart';


class SearchIfEmptyResult extends StatelessWidget {
  const SearchIfEmptyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: NoSomethingBody(
        mainText: "No Results Found!",
        secondaryText:
        "Try a similar word or something more general.",
        image: "assets/icons/no_result.svg",
      ),
    );
  }
}
