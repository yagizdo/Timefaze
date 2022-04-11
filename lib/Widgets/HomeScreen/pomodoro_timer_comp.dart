import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Extentions/locale_keys.g.dart';

class PomodoroComp extends StatelessWidget {
  PomodoroComp({Key? key, required this.lang}) : super(key: key);
  String lang;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '25:00',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 64.sp,
                fontWeight: FontWeight.bold),
          ),
        ),

        // Buttons Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pause Pomodoro Row
            Padding(
              padding: EdgeInsets.only(bottom: 11.h, right: 10.w),
              child: SizedBox(
                width: 110.w,
                height: 40.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'lib/Assets/icons/pauseicon.svg',
                          width: 12,
                        ),
                        Text(
                          LocaleKeys.homepage_pausebutton.tr(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: HexColor('#5F5FFF'),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )),
              ),
            ),

            // Stop Pomodoro Row
            Padding(
              padding: EdgeInsets.only(bottom: 11.h),
              child: SizedBox(
                width: 110.w,
                height: 40.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'lib/Assets/icons/stopicon.svg',
                          width: 12,
                        ),
                        Text(
                          LocaleKeys.homepage_stopbutton.tr(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: HexColor('#5F5FFF'),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
