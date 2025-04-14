import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/address/widgets/add_new_address_icon.dart';
import 'package:store_app/features/address/widgets/address_item.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_text.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "Address"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          StoreAppText(
            title: "Saved Address",
            color: AppColors.primary900,
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          SizedBox(height: 10.h),
          AddressItem(
            title: "Home",
            subtitle: "925 S Chugach St #APT 10, Alas...",
            isSelected: true,
            isDefault: true,
            index: 0,
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 10.h),
          AddressItem(
            title: "Office",
            subtitle: "925 S Chugach St #APT 10, Alas...",
            isSelected: true,
            isDefault: false,
            index: 1,
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 10.h),
          AddressItem(
            title: "Apartment",
            subtitle: "925 S Chugach St #APT 10, Alas...",
            isSelected: true,
            isDefault: false,
            index: 2,
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 10.h),
          AddressItem(
            title: "Parent's House",
            subtitle: "925 S Chugach St #APT 10, Alas...",
            isSelected: true,
            isDefault: false,
            index: 3,
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 10.h),
          AddNewAddressIcon(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: StoreFloatingButton(
          text: "Apply",
          arrow: false,
          callback: () {},
          color: AppColors.primary900,
        ),
      ),
    );
  }
}
