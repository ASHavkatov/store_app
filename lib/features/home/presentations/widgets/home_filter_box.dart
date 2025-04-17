import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/data/models/product_model.dart';

import 'home_filter_box_bottom_sheet.dart';

class HomeFilterBox extends StatefulWidget {
  const HomeFilterBox({super.key,required this.products});

  final List<ProductModel> products;
  @override
  _HomeFilterBoxState createState() => _HomeFilterBoxState();
}

class _HomeFilterBoxState extends State<HomeFilterBox> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return HomeFilterBoxBottomSheet(products: widget.products,);
          },
        );
      },
      child: Container(
        width: 45.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: SvgPicture.asset("assets/icons/filters.svg")),
      ),
    );
  }
}
