import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/home/managers/home_bloc.dart';
import 'package:store_app/features/home/managers/home_state.dart';
import '../../../../data/models/product_model.dart';
import '../../managers/home_event.dart';

class HomeItem extends StatefulWidget {
  final ProductModel product;

  const HomeItem({
    super.key,
    required this.product,
  });

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
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
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final isLike = product.isLiked;
                  return GestureDetector(
                    onTap: () {
                      if (isLike) {
                        context
                            .read<HomeBloc>()
                            .add(UnSavedLoad(unLike: product.id));
                      } else {
                        context
                            .read<HomeBloc>()
                            .add(SavedLoad(like: product.id));
                      }
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
                          isLike
                              ? "assets/icons/heart_filled.svg"
                              : "assets/icons/heart.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "GeneralSans",
          ),
        ),
        Text(
          "\$${product.price.toInt()}",
          style: const TextStyle(
            fontFamily: "GeneralSans",
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}