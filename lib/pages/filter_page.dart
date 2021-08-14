import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/theme.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(fullW * 0.10),
          topRight: Radius.circular(fullW * 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Filter",
                  style: TextStyle(
                    fontSize: fullW * 0.065,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                InkWell(
                  child: Container(
                    width: fullW * 0.32,
                    height: fullH * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(fullW * 0.025),
                      border: Border.all(color: Theme.of(context).primaryColor,),
                      color: Colors.white,
                    ),
                    child: Text("Reset all", style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: fullW * 0.05,
                    ),),
                  ),
                ),
              ],
            ),
          ),
          for(int i = 97; i < 102; i++) Card(
            child: Container(
                padding: EdgeInsets.only(
                  left: fullW * 0.02,
                  right: fullW * 0.02,
                  top: fullH * 0.01,
                  bottom: fullH * 0.01,
                ),
                child: Text("filter $i")
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: Container(
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
              child: Text(
                "APPLY",
                style: TextStyle(
                  color: whiteC,
                  fontSize: fullW * 0.06,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
