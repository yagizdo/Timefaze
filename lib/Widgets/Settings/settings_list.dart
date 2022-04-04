import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Widgets/Settings/settings_item.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  final dropdownItemList = ['Marimba', 'item 2', 'item 3'];
  String? value;
  @override
  Widget build(BuildContext context) {
    List<SettingsItem> items = [
      // Alarm Sound
      SettingsItem(
        'Alarm Sound',
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
        'Auto start Breaks?',
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
      ),

      // Auto start Tasks?
      SettingsItem(
        'Auto start Tasks?',
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
      ),

      // Pomodoro Time
      SettingsItem(
        'Pomodoro Time',
        Container(
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
              '25:00',
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

      // Break Time
      SettingsItem(
        'Break Time',
        Container(
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
              '25:00',
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
