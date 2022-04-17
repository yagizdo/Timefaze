import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Assets/Colors/colors.dart';
import '../../Models/onboard_data.dart';
import '../../Screens/homescreen.dart';
import '../../Screens/onboarding.dart';
import 'button_round_with_shadow.dart';

class OnboardingPagerTypeOne extends StatefulWidget {
  @override
  _OnboardingPagerTypeOneState createState() => _OnboardingPagerTypeOneState();
}

class _OnboardingPagerTypeOneState extends State<OnboardingPagerTypeOne> {
  late PageController _pageController;
  int currentPageValue = 0;

  final List<Widget> introWidgetsList = [];

  @override
  void initState() {
    try {
      introWidgetsList.add(OnboardPageTypeOne(
        data: OnboardData(
            placeHolder: kIsWeb
                ? "lib/Assets/img/onboarding_image_one.svg"
                : "lib/Assets/img/onboarding_image_one.svg",
            title: 'Title',
            description: 'desc'),
      ));
      introWidgetsList.add(OnboardPageTypeOne(
        data: OnboardData(
            placeHolder: kIsWeb
                ? "lib/Assets/img/onboarding_image_two.svg"
                : "lib/Assets/img/onboarding_image_two.svg",
            title: 'title 2',
            description: 'desc 2'),
      ));
      introWidgetsList.add(OnboardPageTypeOne(
        data: OnboardData(
            placeHolder: kIsWeb
                ? "lib/Assets/img/onboarding_image_three.svg"
                : "lib/Assets/img/onboarding_image_three.svg",
            title: 'title 3',
            description: 'desc 3'),
      ));
    } catch (e) {
      print("onboard pager type one error");
      print(e);
    }
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView.builder(
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return introWidgetsList[index];
          },
          onPageChanged: (int page) {
            animatePage(page);
          },
          itemCount: introWidgetsList.length,
          controller: _pageController,
        ),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        color: white,
                        textColor: black,
                        onPressed: () {
//                          Navigator.pushNamed(context, "/welcome_screen");
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(16.0),
                            side: BorderSide(color: black, width: 2.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: RaisedButton(
                        padding: EdgeInsets.all(16),
                        color: wood_smoke,
                        onPressed: () {
                          if (_pageController.hasClients) {
                            if (currentPageValue < 2) {
                              _pageController.animateToPage(
                                currentPageValue + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.pushNamed(context, "/welcome_screen");
                            }
                          } else {
                            Navigator.pushNamed(context, "/welcome_screen");
                          }
                        },
                        textColor: white,
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 21.0, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(16.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        kIsWeb || Platform.isIOS
            ? Positioned(
                left: 24,
                top: 48,
                child: ButtonRoundWithShadow(
                    size: 48,
                    borderColor: wood_smoke,
                    color: white,
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    shadowColor: wood_smoke,
                    iconPath: "lib/Assets/icons/close.svg"),
              )
            : SizedBox(),
      ],
    );
  }

  void animatePage(int page) {
    print('page is $page');
    currentPageValue = page;
    setState(() {});
  }
}
