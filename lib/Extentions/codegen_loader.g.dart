// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "drawer_menu": {
    "settings_title": "Ayarlar",
    "homepage_title": "AnaSayfa"
  },
  "settings": {
    "autostartbreaks": "Molayı otomatik başlat?",
    "breaktime": "Mola Süresi",
    "autostarttasks": "Görevleri otomatik başlat?",
    "alarmsound": "Alarm Sesi",
    "pomotime": "Pomodoro Süresi"
  },
  "homepage": {
    "pausebutton": "Durdur",
    "startbutton": "Pomodoro Başlat ",
    "stopbutton": "Resetle",
    "welcomeback": "Tekrardan Hoşgeldin ",
    "todolist_title": "Yapılacaklar Listesi"
  }
};
static const Map<String,dynamic> en = {
  "drawer_menu": {
    "settings_title": "Settings",
    "homepage_title": "HomePage"
  },
  "settings": {
    "autostartbreaks": "Auto start Breaks?",
    "breaktime": "Break Time",
    "autostarttasks": "Auto start Tasks?",
    "alarmsound": "Alarm Sound",
    "pomotime": "Pomodoro Time"
  },
  "homepage": {
    "pausebutton": "Pause",
    "startbutton": "Start Pomodoro ",
    "stopbutton": "Reset",
    "welcomeback": "Welcome Back ",
    "todolist_title": "To-do List"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
