import 'package:flutter/material.dart';
import 'package:store_app/features/authentication/reset_password/widgets/reset_password_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResetPasswordAppBar(),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
