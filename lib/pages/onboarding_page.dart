import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_page.dart';
import '../main.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      isBottomSafeArea: true,
      skipColor: statusBarC,
      doneColor: statusBarC,
      dotsDecorator: DotsDecorator(
        color: inActiveDotC,
        activeColor: statusBarC,
      ),
      pages: [
        PageViewModel(
          titleWidget: Container(
            width: fullW,
            height: fullH * 0.20,
            alignment: Alignment.center,
            child: Text(
              "${getTranslated(context, 'on_boarding_0')}",
              style: TextStyle(
                fontSize: fullW * 0.065,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // title: "${getTranslated(context, 'on_boarding_0')}",
          bodyWidget: Container(
              width: fullW * 0.90,
              child: Image.asset(
                "assets/onboarding_0.jpg",
                fit: BoxFit.contain,
              )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Container(
            width: fullW,
            height: fullH * 0.20,
            alignment: Alignment.center,
            child: Text(
              "${getTranslated(context, 'on_boarding_1')}",
              style: TextStyle(
                fontSize: fullW * 0.065,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          bodyWidget: Container(
              width: fullW * 0.90,
              child: Image.asset(
                "assets/onboarding_1.jpg",
                fit: BoxFit.contain,
              )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Container(
            width: fullW,
            height: fullH * 0.20,
            alignment: Alignment.center,
            child: Text(
              "${getTranslated(context, 'on_boarding_2')}",
              style: TextStyle(
                fontSize: fullW * 0.065,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          bodyWidget: Container(
              width: fullW * 0.90,
              child: Image.asset(
                "assets/onboarding_2.jpg",
                fit: BoxFit.contain,
              )),
          decoration: pageDecoration,
        ),
      ],
      onSkip: () async {
        _onIntroEnd(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isFirstRun', false);
        isFirstRun = false;
      },
      onDone: () async {
        _onIntroEnd(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isFirstRun', false);
        isFirstRun = false;
      },
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: false,
      skip: Text(
        'Skip >>',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fullW * 0.04,
          color: statusBarC,
        ),
      ),
      done: Text(
        'Start',
        style: TextStyle(
          fontSize: fullW * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
