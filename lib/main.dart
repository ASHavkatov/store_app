import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/dependencies.dart';
import 'package:store_app/core/l10n/app_localizations.dart';
import 'package:store_app/core/l10n/localization_view_model.dart';
import 'package:store_app/core/routing/router.dart';
import 'package:store_app/core/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return MultiProvider(
      providers: providers,
      builder:(context, child)=> MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppThemes.darkTheme,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MyLocalizations.delegate
        ],
        supportedLocales: [
          Locale("uz"),
          Locale("en")
        ],
        locale: context.watch<LocalizationViewModel>().currentLocale,
      ),
    );
  }
}
