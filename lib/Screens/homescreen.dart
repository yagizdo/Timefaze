import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Extentions/localization_service.dart';
import 'package:pomodoro_app/Extentions/t_key.dart';
import 'package:pomodoro_app/Widgets/HomeScreen/drawer_menu.dart';
import 'package:provider/provider.dart';

import '../Providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationController = Get.find<LocalizationController>();
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
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 17.w, top: 15.h),
                          child: Text(
                            '${Tkeys.welcomeback.translate(context)}Yilmaz',
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 17.w),
                          child: Consumer<ThemeProvider>(
                              builder: (context, theme, child) {
                            return ElevatedButton(
                              onPressed: () {
                                ThemeProvider()
                                    .readData('themeMode')
                                    .then((value) {
                                  value == 'light'
                                      ? theme.setDarkMode()
                                      : theme.setLightMode();
                                });
                              },
                              child: Text(
                                Tkeys.startbutton.translate(context),
                                style: TextStyle(color: HexColor('#5F5FFF')),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        /*
                        // Toggle Lang button
                        Padding(
                          padding: EdgeInsets.only(left: 17.w),
                          child: Consumer<ThemeProvider>(
                              builder: (context, theme, child) {
                            return ElevatedButton(
                              onPressed: () {
                                localizationController.toggleLanguage();
                              },
                              child: Text(
                                Tkeys.selectlang.translate(context),
                                style: TextStyle(color: HexColor('#5F5FFF')),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),*/
                      ],
                    )),
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
                ),
              ),
            ],
          )),
    );
  }
}
