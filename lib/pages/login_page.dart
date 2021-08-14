import 'package:flutter/material.dart';
import 'package:loyalty/widgets/auth/forgot_password_button.dart';
import 'package:loyalty/widgets/auth/login_button.dart';
import 'package:loyalty/widgets/auth/login_password_input.dart';
import 'package:loyalty/widgets/auth/logo_inner.dart';

final loginFormKey = GlobalKey<FormState>();


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Form(
      key: loginFormKey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: fullW,
            height: fullH,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  transform: GradientRotation(10 / 4),
                  colors: [
                    Color(0xff3925A1),
                    Color(0xff671499),
                  ],
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: fullH * 0.09,),
                  LogoInner(),
                  LoginPasswordInput(),
                  ForgotPasswordButton(),
                  LoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
