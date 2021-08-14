import 'package:flutter/material.dart';
import 'package:loyalty/widgets/auth/get_recovery_code_button.dart';
import 'package:loyalty/widgets/auth/logo_inner.dart';
import 'package:loyalty/widgets/auth/recovery_phone_input.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Scaffold(
      body: SafeArea(
        child: Container(
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
              ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: fullH * 0.09,),
                LogoInner(),
                RecoveryInput(),
                GetRecoverCodeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
