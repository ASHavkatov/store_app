import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/authentication/login/blocs/login_bloc.dart';
import 'package:store_app/features/authentication/verification/pages/forgot_password_view.dart';
import 'package:store_app/features/authentication/verification/pages/reset_password_view.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/checkout/pages/checkout_view.dart';
import 'package:store_app/features/notification/pages/notification_view.dart';
import '../../data/repositories/auth_repositories_models/auth_repository.dart';
import '../../features/authentication/login/pages/login_view.dart';
import '../../features/authentication/sign_up/manager/sign_up_view_model.dart';
import '../../features/authentication/sign_up/page/sign_up_view.dart';
import '../../features/authentication/terms_and_privacy/cookie_use.dart';
import '../../features/authentication/terms_and_privacy/privacy_view.dart';
import '../../features/authentication/terms_and_privacy/terms_view.dart';
import '../../features/authentication/verification/pages/verification_view.dart';
import '../../features/home/presentations/pages/home_view.dart';
import '../../features/onboarding/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/screen_splash/screen_splash_view.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.login,
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
    GoRoute(
      path: Routes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => LoginBloc(repo: context.read()),
            child: LoginView(),
          ),
    ),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Routes.verification,
      builder:
          (context, state) => BlocProvider(
            create: (context) => VerificationBloc(repo: context.read()),
            child: VerificationView(),
          ),
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => VerificationBloc(repo: context.read()),
            child: ForgotPasswordView(),
          ),
    ),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) => ResetPasswordView(),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => HomeView()),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationView(),
    ),
    GoRoute(
      path: Routes.checkout ,
      builder: (context, state) => CheckoutView(),
    ),
  ],
);
