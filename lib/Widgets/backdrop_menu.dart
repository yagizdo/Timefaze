import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Extentions/locale_keys.g.dart';
import '../Screens/homescreen.dart';
import '../Screens/settings.dart';
import 'HomeScreen/menu_item.dart';

class BackdropMenu extends StatelessWidget {
  const BackdropMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Yilmaz Yagiz Dokumaci',
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 17.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 94.5.w),
          child: Column(
            children: [
              ListTile(
                textColor: Colors.white,
                leading: Icon(Icons.check_box,color: Colors.white,),
                title: Text(LocaleKeys.drawer_menu_homepage_title.tr()),
              ),
              ListTile(
                textColor: Colors.white,
                leading: Icon(Icons.settings,color: Colors.white,),
                title: Text(LocaleKeys.drawer_menu_settings_title.tr()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
