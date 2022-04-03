import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_list.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';
import '../Widgets/HomeScreen/drawer_menu.dart';
import '../Widgets/Settings/profile_comp.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var themeM = 'light';
  @override
  void initState() {
    super.initState();
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
                    const ProfileComp(),
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
