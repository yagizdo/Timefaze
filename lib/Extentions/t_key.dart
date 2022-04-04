import 'package:pomodoro_app/Extentions/localization_service.dart';

enum Tkeys {
  welcomeback,
  startbutton,
  homepage,
  settings,
  stopbutton,
  pausebutton,
  todolist,
  alarmsound,
  autostartbreaks,
  autostarttasks,
  pomotime,
  breaktime,
}

extension TKeysExtention on Tkeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
