import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'ui/ui.dart';

GetIt locator = GetIt.instance;

Future<void> getMovieImageConfiguration() async {}

void getPreDataForApp() {
  locator<MovieImageConfigRepository>().getMovieImageConfig().then((result) {
    if (result.isSuccess) {
      DataShared.instance.setMovieImageConfig(result.data!);
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await EasyLocalization.ensureInitialized();
  ServiceLocator.instance.registerDependencies();

  // Giữ lại màn hình splash 3s để lấy dữ liệu cần thiết
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  getPreDataForApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Future.delayed(Duration(seconds: 3)).then((value) {
    FlutterNativeSplash.remove();
    runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'assets/locales',
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      useFallbackTranslations: true,
    ));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataShared.instance)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        title: 'Flutter App',
        theme: ThemeData(primaryColor: AppColor.primaryColor),
        navigatorKey: GlobalKeys.appRootNavigatorKey,
        initialRoute: RouteNames.topView,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
