import 'package:go_router/go_router.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/features/authentication/reset_password/pages/verification_view.dart';
import '../../features/authentication/login/pages/login_view.dart';
import '../../features/authentication/sign_up/manager/sign_up_view_model.dart';
import '../../features/authentication/sign_up/page/sign_up_view.dart';
import '../../features/authentication/terms_and_privacy/cookie_use.dart';
import '../../features/authentication/terms_and_privacy/privacy_view.dart';
import '../../features/authentication/terms_and_privacy/terms_view.dart';
import '../../features/home/presentations/pages/home_view.dart';
import '../../features/onboarding/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/screen_splash/screen_splash_view.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.onBoarding,
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) => SignUpView(
            vm: SignUpViewModel(authRepo: AuthRepository(client: ApiClient())),
          ),
    ),
    GoRoute(path: Routes.login, builder: (context, state) => LoginView()),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.validation,
      builder: (context, state) => VerificationView(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => HomeView()),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
  ],
);
