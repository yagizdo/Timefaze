import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pomodoro_app/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  var themeM = 'light';
  @override
  void initState() {
    super.initState();
    ThemeProvider().readData('themeMode').then((value) => themeM = value);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
