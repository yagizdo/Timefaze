import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/app_assets.dart';

class TaskCard extends StatefulWidget {
  TaskCard(
      {Key? key,
      required this.title,
      required this.time,
      required this.checkbool})
      : super(key: key);

  String title;
  String time;
  bool checkbool;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool? checkboxbool;

  @override
  void initState() {
    super.initState();
    checkboxbool = widget.checkbool;
  }

  @override
  Widget build(BuildContext context) {
    AppAssets _appAssets = AppAssets();
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
                    widget.title,
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.time,
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
                  child: SvgPicture.asset(
                    _appAssets.start_icon,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 10.w,
                  ),
                )
              // Restart Button
              : MaterialButton(
                  shape: const CircleBorder(),
                  elevation: 0,
                  color: HexColor('#FFBF5F').withOpacity(0.2),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    _appAssets.restart_icon,
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
