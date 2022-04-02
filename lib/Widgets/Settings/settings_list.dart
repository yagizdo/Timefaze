import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_item.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  final dropdownItemList = ['iPhone Ringtone', 'item 2', 'item 3'];
  String? value;
  @override
  Widget build(BuildContext context) {
    List<SettingsItem> items = [
      // Name change setting
      SettingsItem(
        Icons.person,
        'Yilmaz Yagiz Dokumaci',
        TextButton(
          child: Text('Change'),
          onPressed: () {},
        ),
      ),

      // Pomodoro Time
      SettingsItem(
        Icons.alarm,
        'Pomodoro Time',
        Container(
          width: 70.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: HexColor('#393939'),
              )),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('25:00')),
          ),
        ),
      ),

      // Break Time
      SettingsItem(
        Icons.timer,
        'Break Time',
        Container(
          width: 70.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: HexColor('#393939'),
              )),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('05:00')),
          ),
        ),
      ),

      // Alarm Sound
      SettingsItem(
        Icons.volume_up,
        'Alarm Sound',
        Container(
          height: 40.h,
          width: 170.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(
              color: HexColor('#393939'),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: Center(
              child: DropdownButton<String>(
                alignment: Alignment.center,
                value: value ?? dropdownItemList[0],
                style: TextStyle(
                  fontSize: 12.sp,
                  color: HexColor('#393939'),
                ),
                iconSize: 30,
                items: dropdownItemList.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
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
            leading: Icon(items[index].icon),
            title: Text(items[index].title),
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
