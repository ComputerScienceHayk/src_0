import 'package:flutter/material.dart';

import '../../fonts.dart';

class ChooseSexButtons extends StatelessWidget {
  const ChooseSexButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    Widget space = SizedBox(
      height: fullW * 0.10,
    );

    return Container(
      width: fullW,
      height: fullH * 0.20,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.04),
              ),
              child: Container(
                width: fullW * 0.40,
                height: fullH * 0.18,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      MyFlutterApp.male,
                      size: fullW * 0.15,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: fullW * 0.045,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          space,
          InkWell(
            onTap: () {},
            child: Card(
              elevation: 2.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.04),
              ),
              child: Container(
                width: fullW * 0.40,
                height: fullH * 0.18,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      MyFlutterApp.female,
                      size: fullW * 0.15,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontSize: fullW * 0.045,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
