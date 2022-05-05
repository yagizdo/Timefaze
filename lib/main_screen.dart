import 'package:backdrop/backdrop.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/Screens/homescreen.dart';
import 'package:pomodoro_app/Screens/settings.dart';

import 'Extentions/locale_keys.g.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  var _pages = [HomeScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      // Delete backlayer default color
      backLayerBackgroundColor: Colors.transparent,
      // Delete frontlayer default color
      frontLayerBackgroundColor: Colors.transparent,
      // Delete front layer mask
      frontLayerScrim: Colors.transparent,
      // Front layer elevation
      frontLayerElevation: 0,
      // Auto height for front layer
      stickyFrontLayer: true,
      appBar: BackdropAppBar(
          leading: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
            child: Icon(Icons.menu), onTap: () => Backdrop.of(context).fling()),
      )),
      backLayer: SizedBox(
        height: 200.h,
        child: Center(
            child: Column(
          children: [
            Text(
              'Yilmaz Yagiz Dokumaci',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 94.5.w),
              child: Column(
                children: [
                  BackdropNavigationBackLayer(
                    items: [
                      ListTile(
                        textColor: Colors.white,
                        leading: Icon(
                          Icons.check_box,
                          color: Colors.white,
                        ),
                        title: Text(LocaleKeys.drawer_menu_homepage_title.tr()),
                      ),
                      ListTile(
                        textColor: Colors.white,
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(LocaleKeys.drawer_menu_settings_title.tr()),
                      ),
                    ],
                    onTap: (int position) => {setState(() => _currentIndex = position)},
                  )
                ],
              ),
            ),
          ],
        )),
      ),
      frontLayer: _pages[_currentIndex],
    );
  }
}
