import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/checkout/widgets/checkout_title.dart';
import 'package:store_app/features/common/presentations/buttons_row.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/product_detail/blocs/detail_bloc.dart';
import 'package:store_app/features/product_detail/blocs/detail_state.dart';
import 'package:store_app/features/product_detail/presentation/widgets/add_to_cart_bottom.dart';
import 'package:store_app/features/product_detail/presentation/widgets/detail_item.dart';

import '../../../../core/routing/routes.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            return switch (state.status) {
              null => throw UnimplementedError(),
              DetailStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
              DetailStatus.error => const Center(child: Text("Xatolik bor")),
              DetailStatus.idle => ListView(
                children: [
                  DetailItem(
                    imageLength: state.model!.productImage.length,
                    image: state.model!.productImage.first.image,
                    isLiked: state.model!.isLiked,
                  ),
                  SizedBox(height: 13.h),
                  CheckoutTitle(title: state.model!.title, fontSize: 24),
                  GestureDetector(
                    onTap: () {
                      context.push(Routes.getReviews(state.model!.id));
                    },
                    child: SizedBox(
                      height: 22.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/star_filled.svg",
                          ),
                          SizedBox(width: 6),
                          Text(
                            state.model!.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontFamily: "GeneralSans",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "(${state.model!.reviewsCount} reviews)",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: "GeneralSans",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    state.model!.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: "GeneralSans",
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  CheckoutTitle(title: "Choose size", fontSize: 24),
                  ButtonsRow(items: ['S', 'M', 'L']),
                  SizedBox(height: 13.h),
                ],
              ),
            };
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return state.model != null
              ? AddToCartBottom(price: state.model!.price.toString())
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
