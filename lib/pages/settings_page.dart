import 'package:flutter/material.dart';
import 'package:loyalty/widgets/settings_page/settings_buttons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
        width: fullW,
        height: fullH,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              transform: GradientRotation(10 / 4),
              colors: [
                Color(0xff3925A1),
                Color(0xff671499),
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: fullW,
              height: fullH * 0.32,
              alignment: Alignment.center,
              child: Image.asset(
                  "assets/female.jpg",
                  fit: BoxFit.cover,
              ),
            ),
            SettingsButtons(),
          ],
        ),
      );
  }
}
