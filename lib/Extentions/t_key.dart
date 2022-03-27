import 'package:pomodoro_app/Extentions/localization_service.dart';

enum Tkeys { welcomeback, startbutton, homepage, settings }

extension TKeysExtention on Tkeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
