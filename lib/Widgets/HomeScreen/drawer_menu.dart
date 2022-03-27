import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/Extentions/t_key.dart';
import 'package:pomodoro_app/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'menu_item.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  var themeM = 'light';
  bool test = false;

  @override
  void initState() {
    super.initState();
    ThemeProvider().readData('themeMode').then((value) => themeM = value);
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        Icons.check_box,
        Tkeys.homepage.translate(context),
        false,
      ),
      MenuItem(Icons.settings, Tkeys.settings.translate(context), false)
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
                                  fontSize: 20.sp,
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
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<ThemeProvider>(builder: (context, theme, child) {
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
                    })
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            //color: test ? Colors.yellow : Colors.transparent,
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
