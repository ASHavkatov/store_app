import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/home/managers/home_view_model.dart';

class HomeItem extends StatefulWidget {
   HomeItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.isLiked,
  });

  final String title, image;
  final num price;

   bool isLiked;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 161.w,
              height: 174.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isLiked = !widget.isLiked;
                  });
                },
                child: Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      widget.isLiked
                          ? "assets/icons/heart_filled.svg"
                          : "assets/icons/heart.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "GeneralSans",
          ),
        ),
        Text(
          "\$${widget.price.toInt()}",
          style: TextStyle(
            fontFamily: "GeneralSans",
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
