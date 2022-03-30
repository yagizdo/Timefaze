import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Widgets/HomeScreen/tasks_section/task_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 15.w),
          child: Text(
            'Task List',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: HexColor('#393939'),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30.h, top: 5.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskCard();
              }),
        ),
      ],
    );
  }
}
