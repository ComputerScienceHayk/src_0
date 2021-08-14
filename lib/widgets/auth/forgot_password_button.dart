import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/pages/forgot_password_page.dart';

import '../../theme.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return  Container(
      width: fullW,
      height: fullH * 0.05,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: fullW * 0.10),
      child: InkWell(
        onTap: () => Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) =>  ForgotPasswordPage())
        ),
        child:  Text(
          "Forgot password ?",
          style: TextStyle(color: statusBarC),
        ),
      ),
    );
  }
}
