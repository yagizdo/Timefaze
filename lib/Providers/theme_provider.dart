import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Providers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  ThemeData? _themeData;

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

  // methods for shared preferences
  void initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    notifyListeners();
  }

  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      print("Invalid Type");
    }
  }

  Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  ThemeProvider() {
    readData('themeMode').then((value) {
      // print('Selected Theme Data from Local Storage : ${value.toString()}');
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        //print('setting dark theme');

        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    saveData('themeMode', 'light');
    notifyListeners();
  }
}
