import 'package:flutter/material.dart';
import 'package:loyalty/fonts.dart';

class CouponsFilter extends StatelessWidget {
  const CouponsFilter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW * 0.90,
      height: fullH * 0.20,
      child: Column(
        children: [
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            padding: EdgeInsets.only(left: fullW * 0.02, right: fullW * 0.02,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coupons",  style: TextStyle(
                  fontSize: fullW * 0.05,
                  color: Theme.of(context).primaryColor,
                ),),
                Icon(
                  MyFlutterApp.filter_btn,
                  size: fullW * 0.075,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    child: Container(
                        width: fullW * 0.40,
                        height: fullH * 0.05,
                        alignment: Alignment.center,
                        child: Text("All coupons")),
                  ),
                ),
                InkWell(
                  child: Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    child: Container(
                        width: fullW * 0.40,
                        height: fullH * 0.05,
                        alignment: Alignment.center,
                        child: Text("My coupons")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
