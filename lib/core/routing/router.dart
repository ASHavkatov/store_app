import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/pages/account_view.dart';
import 'package:store_app/features/address/blocs/new_address_bloc.dart';
import 'package:store_app/features/address/pages/address_view.dart';
import 'package:store_app/features/address/pages/new_address_view.dart';
import 'package:store_app/features/authentication/sign_up/blocs/signup_bloc.dart';
import 'package:store_app/features/authentication/verification/blocs/verification_bloc.dart';
import 'package:store_app/features/cards/pages/payment_method.dart';
import 'package:store_app/features/checkout/pages/checkout_view.dart';
import 'package:store_app/features/faqs/pages/faqs_view.dart';
import 'package:store_app/features/help_center/pages/help_center_view.dart';
import 'package:store_app/features/home/managers/home_bloc.dart';
import 'package:store_app/features/my_card/blocs/my_cart_bloc.dart';
import 'package:store_app/features/my_card/blocs/my_cart_event.dart';
import 'package:store_app/features/my_card/page/my_card_view.dart';
import 'package:store_app/features/my_details/pages/my_details_view.dart';
import 'package:store_app/features/my_order/blocs/my_order_bloc.dart';
import 'package:store_app/features/my_order/blocs/my_order_event.dart';
import 'package:store_app/features/my_order/pages/my_order_view.dart';
import 'package:store_app/features/new_card/blocs/new_card_bloc.dart';
import 'package:store_app/features/new_card/pages/new_card_view.dart';
import 'package:store_app/features/notification/blocs/notification_bloc.dart';
import 'package:store_app/features/notification/pages/notification_view.dart';
import 'package:store_app/features/notification_settigns/pages/notification_settings.dart';
import 'package:store_app/features/product_detail/blocs/detail_bloc.dart';
import 'package:store_app/features/product_detail/blocs/detail_event.dart';
import 'package:store_app/features/product_detail/presentation/pages/product_detail_view.dart';
import 'package:store_app/features/saved/blocs/saved_bloc.dart';
import 'package:store_app/features/saved/page/saved_view.dart';
import 'package:store_app/features/search/presentation/pages/search_view.dart';
import 'package:store_app/main.dart';

import '../../features/authentication/login/pages/login_view.dart';
import '../../features/authentication/sign_up/page/sign_up_view.dart';
import '../../features/authentication/terms_and_privacy/cookie_use.dart';
import '../../features/authentication/terms_and_privacy/privacy_view.dart';
import '../../features/authentication/terms_and_privacy/terms_view.dart';
import '../../features/authentication/verification/pages/forgot_password_view.dart';
import '../../features/authentication/verification/pages/reset_password_view.dart';
import '../../features/authentication/verification/pages/verification_view.dart';
import '../../features/home/presentations/pages/home_view.dart';
import '../../features/onboarding/onboarding/pages/onboarding_view.dart';
import '../../features/review/presentation/blocs/review_bloc.dart';
import '../../features/review/presentation/blocs/review_event.dart';
import '../../features/review/presentation/pages/reviews_view.dart';
import '../../features/search/presentation/blocs/search_bloc.dart';

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.onBoarding,
  routes: [
    GoRoute(path: Routes.onBoarding, builder: (context, state) => OnboardingView()),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) {
        return BlocProvider(
          create:
              (context) =>
                  ReviewBloc(reviewRepo: context.read())..add(ReviewLoad(id: int.parse(state.pathParameters['id']!))),
          child: ReviewsView(),
        );
      },
    ),
    GoRoute(
      path: Routes.newCard,
      builder:
          (context, state) =>
              BlocProvider(create: (context) => NewCardBloc(repo: context.read()), child: NewCardView()),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) => BlocProvider(create: (context) => SignUpBloc(repo: context.read()), child: SignUpView()),
    ),
    GoRoute(
      path: Routes.login,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: LoginView(),
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final curve = CurvedAnimation(parent: animation, curve: Curves.decelerate);
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(curve),
                child: child,
              );
            },
          ),
    ),
    GoRoute(
      path: Routes.verification,
      builder: (context, state) {
        final email = state.extra as String;
        return BlocProvider.value(value: VerificationBloc(repo: context.read()), child: VerificationView(email: email));
      },
    ),
    GoRoute(path: Routes.helpCenter, builder: (context, state) => HelpCenterView()),
    GoRoute(path: Routes.myDetails, builder: (context, state) => MyDetailsView()),
    GoRoute(
      path: Routes.saved,
      builder:
          (context, state) => BlocProvider(create: (context) => SavedBloc(repo: context.read()), child: SavedView()),
    ),

    GoRoute(
      path: Routes.home,
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (context) => HomeBloc(productRepo: context.read(), sizeRepo: context.read()),
              child: HomeView(),
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final curve = CurvedAnimation(parent: animation, curve: Curves.bounceIn);
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(curve),
                child: child,
              );
            },
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
          return const Scaffold(body: Center(child: Text('Invalid parameters')));
        }
      },
    ),
    GoRoute(
      path: Routes.forgotPassword,
      builder:
          (context, state) =>
              BlocProvider(create: (context) => VerificationBloc(repo: context.read()), child: ForgotPasswordView()),
    ),
    GoRoute(path: Routes.checkout, builder: (context, state) => CheckoutView()),
    GoRoute(
      path: Routes.detail,
      builder:
          (context, state) => BlocProvider(
            create:
                (context) =>
                    DetailBloc(repo: context.read())..add(DetailLoading(id: int.parse(state.pathParameters['id']!))),
            child: ProductDetailView(),
          ),
    ),
    GoRoute(
      path: Routes.notification,
      builder:
          (context, state) =>
              BlocProvider(create: (context) => NotificationBloc(repo: context.read()), child: NotificationView()),
    ),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) =>
              BlocProvider(create: (context) => SearchBloc(productRepository: context.read()), child: SearchView()),
    ),
    GoRoute(path: Routes.terms, builder: (context, state) => TermsView()),
    GoRoute(path: Routes.privacy, builder: (context, state) => PrivacyView()),
    GoRoute(path: Routes.cookieUse, builder: (context, state) => CookieUse()),
    GoRoute(path: Routes.notification, builder: (context, state) => NotificationView()),

    GoRoute(path: Routes.address, builder: (context, state) => AddressView()),
    GoRoute(
      path: Routes.newAddress,
      builder: (context, state) => BlocProvider(create: (context) => NewAddressBloc(), child: NewAddressView()),
    ),
    GoRoute(
      path: Routes.myCard,
      builder:
          (context, state) => BlocProvider(
            create: (context) => MyCartBloc(repo: context.read())..add(MyCartLoading()),
            child: MyCartView(),
          ),
    ),
    GoRoute(path: Routes.account, builder: (context, state) => AccountView()),
    GoRoute(
      path: Routes.myOrders,
      builder:
          (context, state) => BlocProvider(
            create: (context) => MyOrderBloc(repo: context.read())..add(MyOrderLoad()),
            child: MyOrderView(),
          ),
    ),

    GoRoute(path: Routes.notificationSettings, builder: (context, state) => NotificationSettingsView()),
    GoRoute(path: Routes.faqs, builder: (context, state) => FaqsView()),
    GoRoute(path: Routes.card, builder: (context, state) => PaymentMethod()),

  ],
);
