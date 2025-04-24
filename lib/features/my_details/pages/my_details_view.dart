import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/common/presentations/store_app_app_bar.dart';
import 'package:store_app/features/common/presentations/store_app_form_field.dart';
import 'package:store_app/features/common/presentations/store_bottom_navigation_bar.dart';
import 'package:store_app/features/onboarding/onboarding/widgets/store_floating_button.dart';

import '../widgets/my_detail_date.dart';
import '../widgets/my_detail_gender.dart';
import '../widgets/phone_number.dart';

class MyDetailsView extends StatefulWidget {
  MyDetailsView({super.key});

  @override
  State<MyDetailsView> createState() => _MyDetailsViewState();
}

class _MyDetailsViewState extends State<MyDetailsView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  bool? fullNameValid, emailValid;
  DateTime? dateTime;

  Color getBackgroundColor() {
    if (fullNameValid == null || emailValid == null) {
      return AppColors.primary200;
    }
    if (!fullNameValid! || !emailValid!) {
      return AppColors.primary200;
    }
    return AppColors.primary900;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppAppBar(title: "My Details", isTrue: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children:[ Column(
            spacing: 16.h,
            children: [
              StoreAppFormField(
                controller: fullNameController,
                title: "Full Name",
                hintText: "Cody Fisher",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    fullNameValid = false;
                    setState(() {});
                    return "This field is required";
                  }
                  fullNameValid = true;
                  setState(() {});
                  return null;
                },
                isValid: fullNameValid,
                fontWeight: FontWeight.w500,
                color: AppColors.primary900,
                size: 16,
              ),
              StoreAppFormField(
                controller: emailController,
                title: "Email Address",
                hintText: "cody.fisher45@example",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    emailValid = false;
                    setState(() {});
                    return "This field is required";
                  }
                  emailValid = true;
                  setState(() {});
                  return null;
                },
                isValid: emailValid,
                fontWeight: FontWeight.w500,
                color: AppColors.primary900,
                size: 16,
              ),
              MyDetailsDateBirth(title: "Date of Birth"),
              MyDetailGender(),
              PhoneNumber(controller: phoneNumber),
              SizedBox(height: 78.h),
              StoreFloatingButton(
                text: 'Submit',
                arrow: false,
                callback: () {

                },
                color: AppColors.primary900,
              ),
            ],
          ),
        ]
        ),
      ),
      bottomNavigationBar: StoreBottomNavigationBar(),
    );
  }
}
