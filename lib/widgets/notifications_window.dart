import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:loyalty/fonts.dart';

import '../theme.dart';

// ignore: must_be_immutable
class NotificationsWindow extends StatelessWidget {
  bool _agreedToTOS = false;

  bool submittable() {
    return _agreedToTOS;
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(fullW * 0.10),
            topRight: Radius.circular(fullW * 0.10)),
      ),
      padding: EdgeInsets.only(left: fullW * 0.05, right: fullW * 0.05),
      child: Column(
        children: [
          Container(
            width: fullW * 0.90,
            height: fullH * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    width: fullW * 0.40,
                    height: fullH * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        transform: GradientRotation(1 / 1),
                        colors: [
                          Color(0xff3B25A1),
                          Color(0xff62169A),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          MyFlutterApp.mark_all_as_read,
                          color: Colors.white,
                          size: fullW * 0.045,
                        ),
                        Text(
                          "Mark all as read",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fullW * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: IconButton(
                    icon: Icon(
                      MyFlutterApp.trash_btn,
                      color: Color(0xff3B25A1),
                      size: fullW * 0.085,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: 0.5,
            color: Color(0xffAFAFAF),
          ),
          Container(
            width: fullW * 0.90,
            child: Column(
              children: [
                SizedBox(
                  height: fullH * 0.015,
                ),
                Card(
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.02),
                  ),
                  elevation: 1.0,
                  color: Colors.white70,
                  child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MyFlutterApp.booked_coupons_btn,
                          size: fullW * 0.075,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text("Coupon was booked", style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fullW * 0.045,
                        ),textAlign: TextAlign.start,),
                        Theme(
                          child: Checkbox(
                            checkColor: Theme.of(context).primaryColor,
                            //fillColor: MaterialState.disabled(),
                            activeColor: whiteC,
                            value: _agreedToTOS,
                            onChanged: _checked,
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xffAFAFAF), // Your color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: fullH * 0.015,
                ),
                Card(
                  shadowColor: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.02),
                  ),
                  color: Colors.white70,
                  child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: fullW * 0.06,
                          child: Image.asset(
                            "assets/new_card_added.webp",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text("New card was added", style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fullW * 0.045,
                        ),textAlign: TextAlign.start,),
                        Theme(
                          child: Checkbox(
                            checkColor: Theme.of(context).primaryColor,
                            //fillColor: MaterialState.disabled(),
                            activeColor: whiteC,
                            value: _agreedToTOS,
                            onChanged: _checked,
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xffAFAFAF), // Your color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: fullH * 0.015,
                ),
                Card(
                  shadowColor: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.02),
                  ),
                  color: Colors.white70,
                  child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          MyFlutterApp.money_bag,
                          size: fullW * 0.075,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text("You have bonuses", style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fullW * 0.045,
                        ),textAlign: TextAlign.start,),
                        Theme(
                          child: Checkbox(
                            checkColor: Theme.of(context).primaryColor,
                            //fillColor: MaterialState.disabled(),
                            activeColor: whiteC,
                            value: _agreedToTOS,
                            onChanged: _checked,
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xffAFAFAF), // Your color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: fullH * 0.015,
                ),
                Card(
                  shadowColor: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.02),
                  ),
                  color: Colors.white70,
                  child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          MyFlutterApp.coupon_used,
                          size: fullW * 0.075,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text("Coupon was used", style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fullW * 0.045,
                        ),textAlign: TextAlign.start,),
                        Theme(
                          child: Checkbox(
                            checkColor: Theme.of(context).primaryColor,
                            //fillColor: MaterialState.disabled(),
                            activeColor: whiteC,
                            value: _agreedToTOS,
                            onChanged: _checked,
                          ),
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xffAFAFAF), // Your color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _checked(bool checked) {
    print("checked");
  }
}
