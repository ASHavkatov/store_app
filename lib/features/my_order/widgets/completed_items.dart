import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

class CompletedItems extends StatelessWidget {
  const CompletedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary100),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage("assets/images/t-shirt.png"),
              width: 83.w,
              height: 79.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreAppText(
                title: "Regular Fit Slogan",
                color: AppColors.primary900,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 2.h),
              StoreAppText(
                title: "Size M",
                color: AppColors.primary500,
                size: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20),
              StoreAppText(
                title: "\$1,190",
                color: AppColors.primary900,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          // SizedBox(width: 20),
          Column(
            children: [
              Container(
                height: 20.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.completedContainer.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: AppColors.successGreen,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 27),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    builder:
                        (context) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.h),
                              Container(
                                width: 64.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primary100,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StoreAppText(
                                    title: "Leave a Review",
                                    color: AppColors.primary900,
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  GestureDetector(onTap: ()=> context.pop(),child: SvgPicture.asset("assets/icons/cancel.svg")),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Divider(height: 1, color: AppColors.primary100),
                              SizedBox(height: 16.h),
                              StoreAppText(
                                title: "How was your order?",
                                color: AppColors.primary900,
                                size: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 5.h),
                              StoreAppText(
                                title:
                                    "Please give your rating and also your review.",
                                color: AppColors.primary500,
                                size: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 63,
                                  right: 63,
                                ),
                                child: Row(
                                  spacing: 16,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/star_filled.svg",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/star_filled.svg",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/star_filled.svg",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/star_filled.svg",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/star_filled.svg",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormField(
                                maxLines: null,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: AppColors.primary400)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                                    ),
                                  hintText: "Write your review...",
                                  hintStyle: TextStyle(color: AppColors.primary400,fontSize: 16,fontWeight: FontWeight.w400)
                                ),
                              ),
                              SizedBox(height: 16.h),
                              StoreFloatingButton(text: "Submit", arrow: false, callback: ()=> context.pop(), color: AppColors.primary900)

                            ],
                          ),
                        ),
                  );
                },
                child: Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary900,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Leave Review",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
