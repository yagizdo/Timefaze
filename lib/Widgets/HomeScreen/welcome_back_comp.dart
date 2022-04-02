import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Extentions/t_key.dart';

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
                '${Tkeys.welcomeback.translate(context)},Yilmaz',
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
                  Tkeys.startbutton.translate(context),
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
            /*
                        // Toggle Lang button
                        Padding(
                          padding: EdgeInsets.only(left: 17.w),
                          child: Consumer<ThemeProvider>(
                              builder: (context, theme, child) {
                            return ElevatedButton(
                              onPressed: () {
                                localizationController.toggleLanguage();
                              },
                              child: Text(
                                Tkeys.selectlang.translate(context),
                                style: TextStyle(color: HexColor('#5F5FFF')),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),*/
          ],
        ));
  }
}
