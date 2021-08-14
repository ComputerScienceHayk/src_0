import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';

import '../theme.dart';

class LangChangePage extends StatelessWidget {
  const LangChangePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Scaffold(
      body: Container(
        width: fullW,
        height: fullH,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: fullW * 0.90,
              height: fullH * 0.10,
              margin: EdgeInsets.only(top: fullH * 0.04),
              alignment: Alignment.centerLeft,
              child: Text(
                getTranslated(context, "language"),
                style: TextStyle(
                    fontSize: fullW * 0.10,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: fullH * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Card(
                elevation: 2.0,
                child: Container(
                  width: fullW * 0.90,
                  height: fullH * 0.08,
                  padding: EdgeInsets.only(
                    left: fullW * 0.05,
                    right: fullW * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: whiteC,
                    borderRadius: BorderRadius.circular(fullW * 0.02),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslated(context, "eng"),
                        style: TextStyle(
                          fontSize: fullW * 0.045,
                        ),
                      ),
                      Icon(
                        Icons.check,
                        size: fullW * 0.065,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  //child: Text(getTranslated(context, "eng")),
                ),
              ),
            ),
            SizedBox(
              height: fullH * 0.02,
            ),
            InkWell(
              child: Card(
                elevation: 2.0,
                child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    padding: EdgeInsets.only(
                      left: fullW * 0.05,
                      right: fullW * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: whiteC,
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context, "rus"),
                          style: TextStyle(
                            fontSize: fullW * 0.045,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: fullW * 0.065,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: fullH * 0.02,
            ),
            InkWell(
              child: Card(
                elevation: 2.0,
                child: Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    padding: EdgeInsets.only(
                      left: fullW * 0.05,
                      right: fullW * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: whiteC,
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context, "arm"),
                          style: TextStyle(
                            fontSize: fullW * 0.045,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: fullW * 0.065,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: fullH * 0.15,
            ),
            Container(
              width: fullW * 0.90,
              height: fullH * 0.08,
              decoration: BoxDecoration(
                color: Color(0xff5c189b),
                borderRadius: BorderRadius.circular(fullW * 0.02),
              ),
              alignment: Alignment.center,
              child: Text(
                getTranslated(context, "apply"),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fullW * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
