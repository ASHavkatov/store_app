import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/login_sign_up/login/login_view.dart';
import 'package:store_app/onboarding_screen_splash/onboarding/pages/onboarding_view.dart';
import 'package:store_app/onboarding_screen_splash/screen_splash/screen_splash_view.dart';
import 'package:store_app/terms_and_privacy/cookie_use.dart';
import 'package:store_app/terms_and_privacy/privacy_view.dart';
import 'package:store_app/terms_and_privacy/terms_view.dart';

import '../../login_sign_up/sign_up/page/sign_up_view.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.splashScreen,
  routes: [
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpView()),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginView()),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
