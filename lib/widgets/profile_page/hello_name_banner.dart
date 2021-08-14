import 'package:flutter/material.dart';

class HelloNameBanner extends StatelessWidget {
  const HelloNameBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      width: fullW * 0.60,
      height: fullH * 0.06,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(fullW * 0.02),
          bottomLeft: Radius.circular(fullW * 0.02),
          bottomRight: Radius.circular(fullW * 0.02),
        ),
      ),
      child: Text(
        "Hello, please choose your sex.",
        style: TextStyle(
          fontSize: fullW * 0.038,
          color: Colors.black,
        ),
      ),
    );
  }
}
