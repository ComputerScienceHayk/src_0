import 'package:flutter/material.dart';
import 'package:loyalty/fonts.dart';
import 'package:loyalty/localization/consts.dart';

import '../../theme.dart';

class LogoInner extends StatelessWidget {
  const LogoInner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      width: fullW * 0.70,
      height: fullH * 0.38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(fullW * 0.02),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MyFlutterApp.logo,
            size: fullW * 0.40,
            color: whiteC,
          ),
          Text(
            getTranslated(context, "company_name"),
            style: TextStyle(color: whiteC, fontSize: fullW * 0.08),
          ),
          SizedBox(
            height: fullH * 0.02,
          ),
          Text(
            getTranslated(context, "company_slogan"),
            style: TextStyle(color: whiteC, fontSize: fullW * 0.04),
          ),
        ],
      ),
    );
  }
}
