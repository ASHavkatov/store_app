import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/my_order/blocs/my_order_bloc.dart';
import 'package:store_app/features/my_order/blocs/my_order_state.dart';

class OngoingItem extends StatelessWidget {
  const OngoingItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder:
          (context, state) => Container(
            width: double.infinity,
            height: 107.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: AppColors.primary100),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(state.model[index].image,width: 83.w, height: 79.h, fit: BoxFit.cover),
                ),
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoreAppText(
                      title: state.model[index].title,
                      color: AppColors.primary900,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 2.h),
                    StoreAppText(title: state.model[index].size, color: AppColors.primary500, size: 12, fontWeight: FontWeight.w400),
                    SizedBox(height: 20),
                    StoreAppText(title: "${state.model[index].price} \$".toString(), color: AppColors.primary900, size: 14, fontWeight: FontWeight.w600),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 20.h,
                      width: 60.w,
                      decoration: BoxDecoration(color: AppColors.primary100, borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          state.model[index].status,
                          style: TextStyle(color: AppColors.primary900, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 27),
                    Container(
                      height: 30.h,
                      width: 90.w,
                      decoration: BoxDecoration(color: AppColors.primary900, borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          "Track Order",
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
