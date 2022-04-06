import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pomodoro_app/Widgets/HomeScreen/tasks_section/task_card.dart';

import '../../../Extentions/t_key.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Text(
            Tkeys.todolist.translate(context),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: HexColor('#393939'),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(bottom: 30.h, top: 5.h, left: 10.w),
            children: [
              TaskCard(
                title: 'Learn BloC',
                time: '1hr 25 mins',
                checkbool: false,
              ),
              TaskCard(
                title: 'Finish new UI',
                time: '0hr 45 mins',
                checkbool: true,
              ),
              TaskCard(
                title: 'Add Easylocalization',
                time: '1hr 25 mins',
                checkbool: false,
              ),
              TaskCard(
                title: 'Publish custom time picker',
                time: '10hr 55 mins',
                checkbool: false,
              ),
              TaskCard(
                title: 'Post the new UI on twitter',
                time: '0r 10 mins',
                checkbool: true,
              ),
              TaskCard(
                title: 'Follow => twitter.com/yagizdo',
                time: '3hr 45 mins',
                checkbool: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
