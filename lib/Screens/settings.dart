import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_list.dart';

import '../Widgets/HomeScreen/drawer_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('lib/Assets/img/profile.png'),
                        radius: 50.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: SettingsList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}