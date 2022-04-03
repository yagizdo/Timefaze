import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pomodoro_app/Extentions/localization_service.dart';
import 'package:pomodoro_app/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var _themeMode = await ThemeProvider().readData('themeMode');
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, snapshot) => PomodoroApp(
        themeMode: _themeMode,
      ),
    ),
  );
}

class PomodoroApp extends StatelessWidget {
  PomodoroApp({Key? key, required this.themeMode}) : super(key: key);

  final localizationController = Get.put(LocalizationController());
  var themeMode;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: () => GetBuilder<LocalizationController>(
              init: localizationController,
              builder: (LocalizationController controller) {
                return MaterialApp(
                  builder: (context, widget) {
                    ScreenUtil.setContext(context);
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget!,
                    );
                  },
                  title: 'Timefaze',
                  debugShowCheckedModeBanner: false,
                  theme: theme.getTheme(),
                  locale: controller.currentLanguage != ''
                      ? Locale(controller.currentLanguage)
                      : null,
                  localeResolutionCallback:
                      LocalizationService.localeResolutionCallback,
                  supportedLocales: LocalizationService.supportedLocales,
                  localizationsDelegates:
                      LocalizationService.localizationsDelegate,
                  home: const HomeScreen(),
                );
              }));
    });
  }
}
