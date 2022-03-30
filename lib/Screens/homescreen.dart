import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pomodoro_app/Widgets/HomeScreen/drawer_menu.dart';

import '../Widgets/HomeScreen/pomodoro_timer_comp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String defaultLocale;
  @override
  void initState() {
    super.initState();
    defaultLocale = Platform.localeName;
    print('sj : $defaultLocale');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          appBar: SliderAppBar(
            appBarPadding: EdgeInsets.only(top: 30.h),
            appBarHeight: 60.w,
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
                ),
              ),
            ],
          )),
    );
  }
}
