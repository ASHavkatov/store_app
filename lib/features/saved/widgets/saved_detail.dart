import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/features/saved/blocs/saved_bloc.dart';
import 'package:store_app/features/saved/blocs/saved_state.dart';
import '../../checkout/widgets/checkout_title.dart';
import '../blocs/saved_event.dart';

class SavedDetail extends StatelessWidget {
  const SavedDetail({super.key, required this.saved});

  final ProductModel saved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 161.w,
      height: 122.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  saved.image,
                  width: 161.w,
                  height: 122.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 13,
                child: BlocBuilder< SavedBloc, SavedState>(
                  builder:(context, state) {
                     final isLike = saved.isLiked;
                    return GestureDetector(
                    onTap: () {
                      if (isLike) {
                        context.read<SavedBloc>().add(
                          UnSavedLoadS(unLike: saved.id),
                        );
                        context.read<SavedBloc>().add(SavedLoading());
                      } else {
                        context.read<SavedBloc>().add(SavedLoadS(like: saved.id));
                        context.read<SavedBloc>().add(SavedLoading());
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
          SizedBox(height: 8.h),
          CheckoutTitle(
            title: saved.title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 3.h),
          Text(
            saved.price.toString(),
            style: TextStyle(
              fontFamily: "GeneralSans",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
