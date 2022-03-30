import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Extentions/t_key.dart';

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
        Padding(
          padding: EdgeInsets.only(bottom: 11.h),
          child: SizedBox(
            width: lang.contains('tr_US') ? 195.w : 170.w,
            height: 36.h,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.stop,
                      color: Colors.red,
                    ),
                    Text(
                      Tkeys.stopbutton.translate(context),
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
        )
      ],
    );
  }
}
