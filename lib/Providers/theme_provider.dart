import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Providers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  ThemeData? _themeData;
  bool _darkTheme = false;
  bool getBool() => _darkTheme;
  String key = 'themeMode';

  ThemeData? getTheme() => _themeData;


  final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: HexColor('#323232'),
      elevation: 0,
    ),
    // Progress
    secondaryHeaderColor: Colors.redAccent,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
    primaryColor: Colors.white,
    // Scafold
    scaffoldBackgroundColor: HexColor('#323232'),
    brightness: Brightness.light,
  );

  final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: HexColor('#5F5FFF'),
      elevation: 0,
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: Colors.grey.shade300),
    // Progress Border
    secondaryHeaderColor: HexColor('#D047FF'),
    brightness: Brightness.light,
    scaffoldBackgroundColor: HexColor('#5F5FFF'),
  );

  //

  // methods for shared preferences
   initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }

  void saveDataToLocalStorage(bool val) {
    sharedPreferences?.setBool('test', val);
    notifyListeners();
  }

  void loadDataFromLocalStorage() {
    bool? spList = sharedPreferences?.getBool('test');
    if (spList != null) {
      print('gelen data : $spList');
    }
  }

  void toggleTheme() {
    _darkTheme = true;
    saveDataToLocalStorage(true);
    notifyListeners();
  }

}
