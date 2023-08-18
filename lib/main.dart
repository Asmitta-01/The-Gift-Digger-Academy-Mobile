// import 'package:demo_tdgacademy/localizations/app_localization_delegate.dart';
// import 'package:demo_tdgacademy/localizations/language.dart';
import 'package:demo_tdgacademy/theme/app_notifier.dart';
import 'package:demo_tdgacademy/theme/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'views/splash_screen.dart';

Future<void> main() async {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();

  AppTheme.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://f48fda17decfbf41ddb345b3e3f580b8@o4505708262064128.ingest.sentry.io/4505708270583808';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(ChangeNotifierProvider<AppNotifier>(
      create: (context) => AppNotifier(),
      child: const MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          builder: (context, child) {
            return Directionality(
              textDirection: AppTheme.textDirection,
              child: child!,
            );
          },
          // localizationsDelegates: [AppLocalizationsDelegate(context)],
          // supportedLocales: Language.getLocales(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
