import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/widgets/sort_by_buttons.dart';
import 'package:store_app/features/home/widgets/store_icon_button_container.dart';

class HomeFilterBoxBottomSheet extends StatefulWidget {
  const HomeFilterBoxBottomSheet({super.key});

  @override
  State<HomeFilterBoxBottomSheet> createState() => _HomeFilterBoxBottomSheet();
}

class _HomeFilterBoxBottomSheet extends State<HomeFilterBoxBottomSheet> {
  double _minValue = 0;
  double _maxValue = 19;
  String _selectedSize = 'L'; // Declare the selected size

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "GeneralSans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  StoreIconButtonContainer(
                    image: "assets/icons/cancel.svg",
                    callback: () {
                      Navigator.pop(context);
                    },
                    iconWidth: 24,
                    iconHeight: 24,
                  ),
                ],
              ),
              Divider(color: Colors.black.withValues(alpha: 0.3)),
              Text(
                "Sort By",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  fontSize: 16,
                ),
              ),
              SortByButtons(),
              Divider(color: Colors.black.withValues(alpha: 0.3)),
              Text(
                "Price",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 80.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("\$${_minValue.toInt()}-\$${_maxValue.toInt()}"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(thumbColor: Colors.grey),
                      child: RangeSlider(
                        values: RangeValues(_minValue, _maxValue),
                        min: 0,
                        max: 19,
                        divisions: 19,
                        labels: RangeLabels(
                          '\$${_minValue.toStringAsFixed(0)}',
                          '\$${_maxValue.toStringAsFixed(0)}',
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _minValue = values.start;
                            _maxValue = values.end;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black.withValues(alpha: 0.3)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "GeneralSans",
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedSize, // The currently selected value
                    items:
                        <String>[
                          'S',
                          'M',
                          'L',
                          'XL',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSize = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
