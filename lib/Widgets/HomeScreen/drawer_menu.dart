import 'package:flutter/material.dart';
import 'package:pomodoro_app/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                        value == 'light'
                            ? theme.setDarkMode()
                            : theme.setLightMode();
                      });
                    },
                    icon: const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}