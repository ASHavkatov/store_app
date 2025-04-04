import 'package:go_router/go_router.dart';
import 'package:store_app/core/go_route/routes.dart';
import 'package:store_app/login_sign_up/login/login_view.dart';
import 'package:store_app/login_sign_up/sign_up/sign_up_view.dart';
import 'package:store_app/onboarding_screen_splash/onboarding/pages/onboarding_view.dart';

final router = GoRouter(
  initialLocation: Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(),
    )
  ],
);
