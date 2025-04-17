import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentations/widgets/store_button_clickable.dart';

class ButtonsRow extends StatefulWidget {
  final List<String> items; // Accepting categories as a parameter
  ButtonsRow({
    super.key,
    required this.items, // Mark the parameter as required
  });

  @override
  State<ButtonsRow> createState() => _ButtonsRowState();
}

class _ButtonsRowState extends State<ButtonsRow> {
  String? selected; // Default selection

  void updateSelected(String newSelection) {
    setState(() {
      selected = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.items.map((text) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: StoreButtonClickable(
              height: 47.h,
              text: text,
              arrow: false,
              callback: () => updateSelected(text),
              isSelected: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}
