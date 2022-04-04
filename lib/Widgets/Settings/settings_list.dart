import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Extentions/t_key.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_item.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  final dropdownItemList = ['Marimba', 'item 2', 'item 3'];
  Duration _durationPomotime = Duration(minutes: 25);
  Duration _durationBreaktime = Duration(minutes: 5);
  bool checkboxbool = false;
  String? value;
  @override
  Widget build(BuildContext context) {
    List<SettingsItem> items = [
      // Alarm Sound
      SettingsItem(
        Tkeys.alarmsound.translate(context),
        Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: Center(
              child: DropdownButton<String>(
                // Delete dropdown icon
                icon: const Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_downward),
                ),
                alignment: Alignment.center,
                value: value ?? dropdownItemList[0],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                items: dropdownItemList.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
          ),
        ),
      ),

      // Auto start breaks?
      SettingsItem(
        Tkeys.autostartbreaks.translate(context),
        Transform.scale(
          scale: 1.35,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: checkboxbool == false
                ? MaterialStateProperty.all<Color>(Colors.grey)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).scaffoldBackgroundColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            value: checkboxbool,
            onChanged: (bool? value) {},
          ),
        ),
      ),

      // Auto start Tasks?
      SettingsItem(
        Tkeys.autostarttasks.translate(context),
        Transform.scale(
          scale: 1.35,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: checkboxbool == false
                ? MaterialStateProperty.all<Color>(Colors.grey)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).scaffoldBackgroundColor),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            value: checkboxbool,
            onChanged: (bool? value) {},
          ),
        ),
      ),

      // Pomodoro Time
      SettingsItem(
        Tkeys.pomotime.translate(context),
        GestureDetector(
          onTap: () {
            Picker(
              height: 140,
              itemExtent: 40,
              adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                NumberPickerColumn(
                    initValue: _durationPomotime.inMinutes,
                    jump: 5,
                    begin: 15,
                    end: 90,
                    suffix: const Text(' Minutes')),
              ]),
              hideHeader: true,
              confirmText: 'OK',
              confirmTextStyle:
                  TextStyle(inherit: false, color: Colors.red, fontSize: 18.sp),
              title: const Text('Select Pomodoro Time'),
              selectedTextStyle: TextStyle(color: Colors.blue),
              onConfirm: (Picker picker, List<int> value) {
                // You get your duration here
                setState(() {
                  _durationPomotime =
                      Duration(minutes: picker.getSelectedValues()[0]);
                });
              },
            ).showDialog(context);
          },
          child: Container(
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                '${_durationPomotime.inMinutes}:00',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      // Break Time
      SettingsItem(
        Tkeys.breaktime.translate(context),
        GestureDetector(
          onTap: () {
            Picker(
              height: 140,
              itemExtent: 40,
              adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                NumberPickerColumn(
                    initValue: _durationBreaktime.inMinutes,
                    jump: 5,
                    begin: 15,
                    end: 90,
                    suffix: const Text(' Minutes')),
              ]),
              hideHeader: true,
              confirmText: 'OK',
              confirmTextStyle:
                  TextStyle(inherit: false, color: Colors.red, fontSize: 18.sp),
              title: const Text('Select Break Time'),
              selectedTextStyle: TextStyle(color: Colors.blue),
              onConfirm: (Picker picker, List<int> value) {
                // You get your duration here
                setState(() {
                  _durationBreaktime =
                      Duration(minutes: picker.getSelectedValues()[0]);
                });
              },
            ).showDialog(context);
          },
          child: Container(
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Center(
              child: Text(
                '${_durationBreaktime.inMinutes.toString().padLeft(2, '0')}:00',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    // Settings List
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index].title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: HexColor('#323232'), fontWeight: FontWeight.w500),
              ),
            ),
            trailing: items[index].trailing,
          );
        },
      ),
    );
  }
}

// DropdownMenu
DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
