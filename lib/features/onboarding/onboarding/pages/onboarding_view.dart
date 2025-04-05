import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/l10n/localization_view_model.dart';
import 'package:store_app/core/utils/colors.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/store_floating_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale(
                "uz",
              );
            },
            child: Text("uz"),
          ),
          TextButton(
            onPressed: () {
              context.read<LocalizationViewModel>().currentLocale = Locale(
                "en",
              );
            },
            child: Text("en"),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                height: 0.8,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                fontSize: 64,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 35,
            child: IgnorePointer(
              child: Image.asset("assets/images/onboarding.png"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 107,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          child: GestureDetector(
            onTap: () {
              context.go(Routes.signUp);
            },
            child: StoreFloatingButton(
              text: MyLocalizations.of(context)!.getStarted,
              arrow: true,
              callback: () {},
              color: AppColors.primary900,
            ),
          ),
        ),
      ),
    );
  }
}
