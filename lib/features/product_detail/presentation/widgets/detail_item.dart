import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors.dart';

// ignore: must_be_immutable
class DetailItem extends StatefulWidget {
  DetailItem({super.key,this.isLiked = false});

  bool isLiked;
  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 368.h,
          child: PageView(
            controller: _pageController,
            children: [
              _buildImage(),
              _buildImage(),
              _buildImage(),
            ],
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.isLiked = !widget.isLiked;
              });
            },
            child: Container(
              width: 45.w,
              height: 48.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary300,
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    width: 25,
                    widget.isLiked
                        ? "assets/icons/heart_filled.svg"
                        : "assets/icons/heart.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.black
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      width: 341.w,
      height: 368.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          "assets/images/t-shirt.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
