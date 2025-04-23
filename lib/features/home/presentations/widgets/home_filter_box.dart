import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/data/models/sizes_model.dart';

import '../../managers/home_bloc.dart';
import '../../managers/home_event.dart';
import 'home_filter_box_bottom_sheet.dart';

class HomeFilterBox extends StatefulWidget {
  const HomeFilterBox({super.key});

  @override
  _HomeFilterBoxState createState() => _HomeFilterBoxState();
}

class _HomeFilterBoxState extends State<HomeFilterBox> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final filters = await showModalBottomSheet<HomeLoad?>(
          useSafeArea: true,
          context: context,
          builder: (context) =>
              HomeFilterBoxBottomSheet(),);
        if (filters != null) {
          context.read<HomeBloc>().add(filters);}
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
