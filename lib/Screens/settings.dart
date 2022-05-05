import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_list.dart';
import 'package:provider/provider.dart';

import '../Extentions/locale_keys.g.dart';
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
    //ThemeProvider().readData().then((value) => themeM = value);
    //Provider.of<ThemeProvider>(context,listen: false).dataCek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: settingsAppBar(context),
        slider: const DrawerMenu(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  ProfileComp(),
                ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 16.sp, left: 15.sp, right: 15.sp),
                      child: Text(
                        LocaleKeys.drawer_menu_settings_title.tr(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: HexColor('#323232'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.sp, right: 15.sp),
                        child: const SettingsList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsAppBar(BuildContext context) {
    return SliderAppBar(
      trailing: Consumer<ThemeProvider>(builder: (context, theme, child) {
        return IconButton(
          onPressed: () {
           //Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            print('tiklandi');
          },
          icon: Icon(
                  Icons.wb_sunny,
                  size: 25.w,
                  color: Colors.white,
                )
        );
      }),
      appBarPadding: EdgeInsets.only(top: 30.h),
      appBarHeight: 60.w,
      title: const Text(''),
      drawerIconColor: Colors.white,
      appBarColor: Theme.of(context).appBarTheme.backgroundColor!,
    );
  }
}
