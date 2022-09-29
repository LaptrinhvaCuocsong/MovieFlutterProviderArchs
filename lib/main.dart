import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await EasyLocalization.ensureInitialized();
  ServiceLocator.instance.registerDependencies();
  Future.delayed(Duration(seconds: 1)).then((value) => {
        runApp(EasyLocalization(
          child: MyApp(),
          supportedLocales: [Locale('en'), Locale('vi')],
          path: 'assets/locales',
          fallbackLocale: Locale('en'),
          useOnlyLangCode: true,
          useFallbackTranslations: true,
        ))
      });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DataShared())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        title: 'Flutter App',
        theme: ThemeData(primaryColor: AppColor.primaryColor),
        initialRoute: "/",
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
