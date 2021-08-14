import 'package:flutter/material.dart';
import 'package:loyalty/widgets/auth/acept_agreements_checkbox.dart';
import 'package:loyalty/widgets/auth/logo_inner.dart';
import 'package:loyalty/widgets/auth/reg_button.dart';
import 'package:loyalty/widgets/auth/reg_name_input.dart';
import 'package:loyalty/widgets/auth/reg_pass_re_pass_inputs.dart';

final regFormKey = GlobalKey<FormState>();


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Form(
      key: regFormKey,
      child: Scaffold(
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
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: fullH * 0.09,),
                  LogoInner(),
                  RegNameInput(),
                  RegPassRePassInputs(),
                  CkeckBoxOfAgreements(),
                  RegButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
