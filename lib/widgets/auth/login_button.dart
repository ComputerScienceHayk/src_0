import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/pages/root_page.dart';
import 'package:loyalty/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../theme.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return InkWell(
      onTap: () {
        if (loginFormKey.currentState.validate()) {
          if(passStatus == "correct password" ) {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => RootPage()));

            keepSession();
          } else if (passStatus == "wrong password" ) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Please try again"),
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
        margin: EdgeInsets.only(top: fullH * 0.08),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fullW * 0.04),
          border: Border.all(color: whiteC, width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          "Login",
          style: TextStyle(color: whiteC, fontSize: fullW * 0.065),
        ),
      ),
    );
  }
  keepSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', passStatus);
    print('pass.pass["phone"]');
    print(passStatus);
  }
}
