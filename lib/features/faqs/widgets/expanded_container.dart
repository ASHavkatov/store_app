import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/colors.dart';

class ExpandedContainer extends StatefulWidget {
  const ExpandedContainer({super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  State<ExpandedContainer> createState() => _ExpandedContainerState();
}

class _ExpandedContainerState extends State<ExpandedContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary100),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.primary900,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                isExpanded
                    ? SvgPicture.asset("assets/icons/arrow-up.svg")
                    : SvgPicture.asset("assets/icons/arrow-dawn.svg"),
              ],
            ),
          ),
          AnimatedCrossFade(
            firstChild: SizedBox.shrink(),
            secondChild: Column(
              children: [
                SizedBox(height: 5,),
                Text(
                  widget.subtitle,
                  style: TextStyle(color: AppColors.primary500, fontSize: 12),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
