import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  var themeMode;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
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
          debugShowCheckedModeBanner: false,
          theme: theme.getTheme(),
          home: const HomeScreen(),
        ),
      );
    });
  }
}
