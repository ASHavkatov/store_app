import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key, required this.image, required this.title, required this.discount, required this.price});

  final String title, image;
  final num price, discount;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.h,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  6,
                ),
                child: Image.network(
                  width: 56.w,
                  height: 53.h,
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "GeneralSans",
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${price.toInt()}",
                        style: const TextStyle(
                          fontFamily: "GeneralSans",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      discount != 0 ? Text(
                        "-${discount.toInt()}%",
                        style: const TextStyle(
                          color: Colors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Transform.rotate(
            angle: 2.5,
            child: SvgPicture.asset(
              "assets/icons/back-arrow.svg",
            ),
          ),
        ],
      ),
    );
  }
}
