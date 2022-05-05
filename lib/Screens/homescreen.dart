import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/HomeScreen/pomodoro_timer_comp.dart';
import '../Widgets/HomeScreen/tasks_section/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String defaultLocale;
  void initState() {
    super.initState();
    defaultLocale = Platform.localeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating action button
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Icon(
          Icons.add,
          size: 35.sp,
        ),
      ),
      body: Column(
          children: [
            Expanded(
              flex: 2,
              child: PomodoroComp(
                lang: defaultLocale,
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: const TasksList(),
              ),
            ),
          ],
        ),
    );
  }
}
