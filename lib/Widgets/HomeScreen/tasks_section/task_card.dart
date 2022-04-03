import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool checkboxbool = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Checkbox and Task-time Row
          Row(
            children: [
              Transform.scale(
                scale: 1.35,
                child: Checkbox(
                  checkColor: Colors.white,
                  fillColor: checkboxbool == false
                      ? MaterialStateProperty.all<Color>(Colors.grey)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).scaffoldBackgroundColor),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  value: checkboxbool,
                  onChanged: (bool? value) {},
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task',
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '1hr 25 mins',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          checkboxbool == false
              // Play  button
              ? MaterialButton(
                  shape: const CircleBorder(),
                  elevation: 0,
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.2),
                  onPressed: () {},
                  child: Icon(Icons.play_arrow,
                      color: Theme.of(context).scaffoldBackgroundColor),
                )
              // Restart Button
              : MaterialButton(
                  shape: const CircleBorder(),
                  elevation: 0,
                  color: HexColor('#FFBF5F').withOpacity(0.2),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'lib/Assets/icons/againicon.svg',
                    width: 18.w,
                    placeholderBuilder: (BuildContext context) => Container(
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
