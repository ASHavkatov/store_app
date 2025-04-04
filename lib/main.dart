import 'package:flutter/material.dart'
import 'package:store_app/login_sign_up/login/login_view.dart';
import 'package:store_app/onboarding_screen_splash/onboarding/pages/onboarding_view.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView()
    );
  }
}
