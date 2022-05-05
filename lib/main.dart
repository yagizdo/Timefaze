import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomodoro_app/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Extentions/codegen_loader.g.dart';
import 'Screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Easy Localization
  EasyLocalization.ensureInitialized();
  ThemeProvider().initSharedPreferences();
  bool value2 = ThemeProvider().getBool();
  print('gelen data artik gelsin : $value2');
  //var _themeMode = await ThemeProvider().readData();
  // Portrait Mode Lock
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, snapshot) => EasyLocalization(
        path: 'lib/langs',
        supportedLocales: const [
          Locale('en'),
          Locale('tr'),
        ],
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: PomodoroApp(
        ),
      ),
    ),
  );
}

class PomodoroApp extends StatelessWidget {
  PomodoroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      print('gelen data main : ${theme.getBool()}');
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          title: 'Timefaze',
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          theme: theme.getBool() ? theme.darkTheme : theme.lightTheme,
          home: const HomeScreen(),
        ),
      );
    });
  }
}
