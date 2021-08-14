import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';

import '../../theme.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      width: fullW * 0.90,
      height: fullH * 0.08,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          transform: GradientRotation(10 / 4),
          colors: [
            Color(0xff3925A1),
            Color(0xff62169A),
          ],
        ),
        borderRadius: BorderRadius.circular(fullW * 0.025),
      ),
      child: Text(getTranslated(context, "apply"), style: TextStyle(fontSize: fullW * 0.05, color: whiteC),),
    );
  }
}
