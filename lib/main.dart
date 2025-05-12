import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/dependencies.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/l10n/localization_view_model.dart';
import 'package:store_app/core/routing/router.dart';
import 'package:store_app/core/utils/themes.dart';
import 'package:store_app/data/models/product_model/product_model.dart';
import 'package:store_app/firebase_options.dart';
import 'package:hive/hive.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cacheDir = await getApplicationCacheDirectory();
  Hive.init(cacheDir.path);
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>("products");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onMessage.listen((RemoteMessage event) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return MultiProvider(
      providers: providers,
      builder:
          (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: AppThemes.lightTheme,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizations.delegate,
            ],
            supportedLocales: [Locale("uz"), Locale("en")],
            locale: context.watch<LocalizationViewModel>().currentLocale,
          ),
    );
  }
}
