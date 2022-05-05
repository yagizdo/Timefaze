import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro_app/constants/app_assets.dart';

class ProfileComp extends StatelessWidget {
  const ProfileComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAssets _appAssets = AppAssets();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 43.w,
          child: CircleAvatar(
            backgroundImage: AssetImage(_appAssets.profile_pic),
            radius: 40.w,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
              child: Text(
                'Yilmaz Yagiz Dokumaci',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SvgPicture.asset(_appAssets.edit_icon),
            ),
          ],
        )
      ],
    );
  }
}
