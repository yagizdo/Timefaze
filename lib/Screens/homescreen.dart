import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pomodoro_app/Widgets/HomeScreen/drawer_menu.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';
import '../Widgets/HomeScreen/pomodoro_timer_comp.dart';
import '../Widgets/HomeScreen/tasks_section/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String defaultLocale;
  var themeM = 'light';
  @override
  void initState() {
    super.initState();
    defaultLocale = Platform.localeName;
    ThemeProvider().readData('themeMode').then((value) => themeM = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: SliderAppBar(
          trailing: Consumer<ThemeProvider>(builder: (context, theme, child) {
            return IconButton(
              onPressed: () {
                ThemeProvider().readData('themeMode').then((value) {
                  if (value == 'light') {
                    theme.setDarkMode();
                    setState(() {
                      themeM = 'dark';
                    });
                  } else {
                    theme.setLightMode();
                    setState(() {
                      themeM = 'light';
                    });
                  }
                });
              },
              icon: themeM == 'dark'
                  ? Icon(
                      Icons.wb_sunny,
                      size: 25.w,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.dark_mode_outlined,
                      size: 25.w,
                      color: Colors.white,
                    ),
            );
          }),
          appBarPadding: EdgeInsets.only(
            top: 30.h, /*left: 15.w*/
          ),
          appBarHeight: 60.w,
          //drawerIcon: SvgPicture.asset('lib/Assets/icons/feather_menu.svg'),
          title: const Text(''),
          drawerIconColor: Colors.white,
          appBarColor: Theme.of(context).appBarTheme.backgroundColor!,
        ),
        slider: const DrawerMenu(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PomodoroComp(
                lang: defaultLocale,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: const TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
