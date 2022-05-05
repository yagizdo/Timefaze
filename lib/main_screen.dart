import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/Screens/homescreen.dart';
import 'package:pomodoro_app/Screens/settings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _pages = [HomeScreen(),SettingsScreen()];
    int _currentIndex = 0;
    return BackdropScaffold(
        appBar: AppBar(
          leading:  LayoutBuilder(
            builder: (context, constraints) => GestureDetector(
                child: Icon(Icons.menu),
                onTap: () => Backdrop.of(context).fling()),
          )
        ),
        backLayer: Text('BACK'),
        frontLayer:_pages[_currentIndex],
    );
  }
}
