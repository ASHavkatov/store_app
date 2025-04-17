import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/pages/account_view.dart';
import 'package:store_app/features/address/blocs/new_address_bloc.dart';
import 'package:store_app/features/address/pages/address_view.dart';
import 'package:store_app/features/address/pages/new_address_view.dart';
import 'package:store_app/features/authentication/login/blocs/login_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/checkout/pages/checkout_view.dart';
import 'package:store_app/features/home/managers/home_bloc.dart';
import 'package:store_app/features/my_card/page/my_card_view.dart';
import 'package:store_app/features/my_order/pages/my_order_view.dart';
import 'package:store_app/features/notification/pages/notification_view.dart';
import 'package:store_app/features/product_detail/presentation/pages/product_detail_view.dart';
import 'package:store_app/features/saved/blocs/saved_bloc.dart';
import 'package:store_app/features/saved/page/saved_view.dart';
import 'package:store_app/features/search/presentation/pages/search_view.dart';
import 'package:store_app/main.dart';
import '../../data/repositories/auth_repositories_models/auth_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../features/authentication/login/pages/login_view.dart';
import '../../features/authentication/sign_up/manager/sign_up_view_model.dart';
import '../../features/authentication/sign_up/page/sign_up_view.dart';
import '../../features/authentication/terms_and_privacy/cookie_use.dart';
import '../../features/authentication/terms_and_privacy/privacy_view.dart';
import '../../features/authentication/terms_and_privacy/terms_view.dart';
import '../../features/authentication/verification/pages/forgot_password_view.dart';
import '../../features/authentication/verification/pages/reset_password_view.dart';
import '../../features/authentication/verification/pages/verification_view.dart';
import '../../features/home/presentations/pages/home_view.dart';
import '../../features/onboarding/onboarding/pages/onboarding_view.dart';
import '../../features/onboarding/screen_splash/screen_splash_view.dart';

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
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
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider.value(
          value: VerificationBloc(repo: context.read()),
          child: VerificationView(email: email),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) => HomeBloc(
                  productRepo: ProductRepository(client: ApiClient()),
                ),
            child: HomeView(),
          ),
    ),

    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) {
        final extra = state.extra;
        if (extra is Map<String, String>) {
          final email = extra["email"]!;
          final code = extra["code"]!;
          return BlocProvider.value(
            value: VerificationBloc(repo: context.read()),
            child: ResetPasswordView(email: email, code: code),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text('Invalid parameters')),
          );
        }
      },
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder:
          (context, state) => BlocProvider(
            create: (context) => VerificationBloc(repo: context.read()),
            child: ForgotPasswordView(),
          ),
    ),
    GoRoute(path: Routes.checkout, builder: (context, state) => CheckoutView()),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationView(),
    ),
    GoRoute(path: Routes.search, builder: (context, state) => SearchView()),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationView(),
    ),

    GoRoute(
      path: Routes.address ,
      builder: (context, state) => AddressView(),
    ),
    GoRoute(
      path: Routes.newAddress ,
      builder: (context, state) => BlocProvider(create:(context)=> NewAddressBloc(), child: NewAddressView(),),
    ),
    GoRoute(
      path: Routes.account ,
      builder: (context, state) => AccountView(),
    ),
    GoRoute(
      path: Routes.myOrders ,
      builder: (context, state) => MyOrderView(),
    ),
  ],
);
