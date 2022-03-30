import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 350.w,
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
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('UX Articles reading'),
                      Text('1h 25 mins'),
                    ],
                  ),
                ],
              ),
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
