import 'package:flutter/material.dart';

import '../../fonts.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH * 0.45,
      margin: EdgeInsets.only(left: fullW * 0.10, right: fullW * 0.10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.02),
                ),
                child: Container(
                  width: fullW * 0.36,
                  height: fullH * 0.18,
                  padding: EdgeInsets.only(top: fullH * 0.02, bottom: fullH * 0.02),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        MyFlutterApp.get_bonuses_btn,
                        size: fullW * 0.10,
                        color: Color(0xff4324A1),
                      ),
                      Text(
                        "Get bonuses",
                        style: TextStyle(
                            color: Color(0xff4324A1), fontSize: fullW * 0.04, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.02),
                ),
                child: Container(
                  width: fullW * 0.36,
                  height: fullH * 0.18,
                  padding: EdgeInsets.only(top: fullH * 0.02, bottom: fullH * 0.02),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        MyFlutterApp.use_coupons_btn,
                        size: fullW * 0.10,
                        color: Color(0xff4324A1),
                      ),
                      Text(
                        "Use coupons",
                        style: TextStyle(
                          color: Color(0xff4324A1), fontSize: fullW * 0.04, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: fullH * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.02),
                ),
                child: Container(
                  width: fullW * 0.36,
                  height: fullH * 0.18,
                  padding: EdgeInsets.only(top: fullH * 0.02, bottom: fullH * 0.02),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        MyFlutterApp.add_card_btn,
                        size: fullW * 0.10,
                        color: Color(0xff4324A1),
                      ),
                      Text(
                        "Add card",
                        style: TextStyle(
                          color: Color(0xff4324A1), fontSize: fullW * 0.04, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.02),
                ),
                child: Container(
                  width: fullW * 0.36,
                  height: fullH * 0.18,
                  padding: EdgeInsets.only(top: fullH * 0.02, bottom: fullH * 0.02),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        MyFlutterApp.building,
                        size: fullW * 0.10,
                        color: Color(0xff4324A1),
                      ),
                      Text(
                        "Companies",
                        style: TextStyle(
                          color: Color(0xff4324A1), fontSize: fullW * 0.04, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
