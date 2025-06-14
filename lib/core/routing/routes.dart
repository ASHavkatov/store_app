class Routes{
  static const home = "/";
  static const onBoarding = "/onboarding";
  static const login = "/login";
  static const signUp = "/signUp";
  static const terms = "/terms";
  static const privacy = "/privacy";
  static const cookieUse = "/cookieUse";
  static const verification = "/verification";
  static const splashScreen = '/splash-screen';
  static const notification = '/notification';
  static const forgotPassword = '/forgot-password';
  static const checkout = '/checkout';
  static const resetPassword = '/reset-password';
  static const detail = '/detail/:id';
  static const address = '/address';
  static const newAddress = '/new-address';
  static const account = '/account';
  static const saved = '/saved';
  static const search = '/search';
  static const myOrders = '/my-orders';
  static const myCard = '/my-cart';
  static const notificationSettings = '/notification-settings';
  static const myDetails ='/my-details';
  static const faqs = '/faqs';
  static const helpCenter = '/help-center';
  static const reviews = '/reviews/:id';
  static const newCard = '/new-card';
  static const card = '/card';
  static const customerService = '/customer-service';

  static String getDetail(int id)=> "/detail/$id";

  static String getReviews(int id)=> "/reviews/$id";

}