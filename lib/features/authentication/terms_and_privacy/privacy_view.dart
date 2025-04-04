import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';

import '../../../core/routing/routes.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: GestureDetector(
            onTap: () {
              context.go(Routes.signUp);
            },
            child: SvgPicture.asset("assets/icons/store_shop_back-arrow.svg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              Text(
                " Apple Customer Privacy Policy\n\n",
                style: TextStyle(

                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Apple is committed to your privacy. Read our customer Privacy Policy for a clear explanation of how we collect, use, disclose, transfer, and store your information.\n\n"
                "To access and manage your Apple data please visit Manage your Apple account. For corrections or general enquiries, please Contact Privacy.\n\n",
                style: TextStyle(color: AppColors.primary500, fontWeight: FontWeight.w500, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



