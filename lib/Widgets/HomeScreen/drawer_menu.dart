import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    const Text(
                      'Yilmaz Yagiz\nDokumaci',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
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
                            ? const Icon(Icons.wb_sunny)
                            : const Icon(
                                Icons.dark_mode_outlined,
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
                                    style: const TextStyle(color: Colors.white),
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
