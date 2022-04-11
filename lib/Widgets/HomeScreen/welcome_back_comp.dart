import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Extentions/locale_keys.g.dart';

class WelcomeBackComp extends StatelessWidget {
  const WelcomeBackComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17.w, top: 20.h),
              child: Text(
                LocaleKeys.homepage_welcomeback.tr(args: ['Yilmaz']),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, top: 10.h),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  LocaleKeys.homepage_startbutton.tr(),
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: HexColor('#5F5FFF'))),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
