import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.isDefault,
     required this.selectedIndex, required this.onChanged, required this.index,

  });

  final String title, subtitle;
  final bool isSelected, isDefault;
  final int selectedIndex, index;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onChanged(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
        height: 76.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: AppColors.primary100),
        ),
        child: Row(
          spacing: 14.w,
          children: [
            SvgPicture.asset("assets/icons/map_pin.svg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Row(
                  children: [
                    StoreAppText(
                      title: title,
                      color: AppColors.primary900,
                      fontWeight: FontWeight.w600,
                      size: 14,
                    ),
                    SizedBox(width: 3),
                    if (isDefault)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 9.w,vertical: 3.h),
                        width: 52.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text("Default",style: TextStyle(color: AppColors.primary900,fontSize: 9,fontWeight: FontWeight.w500),) ,
                      ),
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: AppColors.primary500, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Radio<int>(value: index, groupValue: selectedIndex, onChanged: (value)=> onChanged(value!), activeColor: AppColors.primary900,)
          ],
        ),
      ),
    );
  }
}
