import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/pages/auth_page.dart';
import 'package:loyalty/pages/login_page.dart';
import 'package:loyalty/pages/reg_page.dart';
import 'package:loyalty/theme.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class ContinueButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;



    return InkWell(
      onTap: () {
        if (authFormKey.currentState.validate()) {
          if (statusMessage == "already exists") {
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => LoginPage()));
          } else if (statusMessage ==
              "no such user") {
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => RegisterPage()));
          } else if(statusMessage == null){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Please try again"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Please try again *"),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Please try again *"),
            ),
          );
        }
      },
      child: Container(
        width: fullW * 0.90,
        height: fullH * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fullW * 0.04),
          border: Border.all(color: whiteC, width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          "Continue",
          style: TextStyle(color: whiteC, fontSize: fullW * 0.065),
        ),
      ),
    );
  }
}
