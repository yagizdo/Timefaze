import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/Extentions/locale_keys.g.dart';

import '../../Screens/homescreen.dart';
import '../../Screens/settings.dart';
import 'menu_item.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        Icons.check_box,
        LocaleKeys.drawer_menu_homepage_title.tr(),
        false,
      ),
      MenuItem(
          Icons.settings, LocaleKeys.drawer_menu_settings_title.tr(), false)
    ];
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yilmaz Yagiz',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Dokumaci',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        menuItems[index].title ==
                                LocaleKeys.drawer_menu_homepage_title.tr()
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              )
                            : menuItems[index].title ==
                                    LocaleKeys.drawer_menu_settings_title.tr()
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SettingsScreen(),
                                    ),
                                  )
                                : null;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                menuItems[index].icon,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  menuItems[index].title,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
