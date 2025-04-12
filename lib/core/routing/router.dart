import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/authentication/login/blocs/login_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/home/managers/home_view_model.dart';
import 'package:store_app/features/notification/pages/notification_view.dart';
import 'package:store_app/features/search/presentation/pages/search_view.dart';
import 'package:store_app/main.dart';
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
  navigatorKey: navigatorKey,
  initialLocation: Routes.search,
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
    // GoRoute(path: Routes.resetPassword, builder: (context state)=> BlocProvider(create: context.read(),child: Rese,))
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => ChangeNotifierProvider(
            create:
                (context) => HomeViewModel(
                  productRepo: ProductRepository(client: ApiClient()),
                ),
            child: HomeView(),
          ),
    ),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationView(),
    ),
    GoRoute(path: Routes.search, builder: (context, state) => SearchView()),
  ],
);
