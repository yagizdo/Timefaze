import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checkBoxCheck = false;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 350.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  spreadRadius: 1)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: RoundCheckBox(
                      onTap: (selected) {
                        selected = checkBoxCheck;
                      },
                      isChecked: checkBoxCheck,
                      size: 35,
                      checkedColor: Theme.of(context).scaffoldBackgroundColor,
                      uncheckedColor: Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                  // Time and Title
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('UX Articles reading'),
                      Text('1h 25 mins'),
                    ],
                  ),
                ],
              ),
              // Play - Pause Button
              MaterialButton(
                shape: const CircleBorder(),
                textColor: Colors.white,
                color: Theme.of(context).scaffoldBackgroundColor,
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
