import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../theme.dart';

class LoginPasswordInput extends StatefulWidget {
  @override
  _LoginPasswordInputState createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {


  FocusNode _focusNode = FocusNode();

  final passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.only(
          left: fullW * 0.05,
          right: fullW * 0.05,
          top: fullH * 0.10,
        ),
        child: TextFormField(
          obscureText: !this._showPassword,
          controller: passwordController,
          focusNode: _focusNode,
          decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: whiteC),
                borderRadius: BorderRadius.circular(fullW * 0.035),
              ),
              fillColor: whiteC,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(fullW * 0.035),
                borderSide: BorderSide(color: whiteC),
              ),
              labelText: 'Password',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              prefixText: ' ',
              //suffixText: 'USD',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this._showPassword
                      ? Theme.of(context).primaryColor
                      : inActive,
                ),
                onPressed: () {
                  setState(() => this._showPassword = !this._showPassword);
                },
              ),
              suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is Required';
            } else if (passStatus == "wrong password") {
              passwordController.text = "";
              return 'Password is incorrect';
            }
            return null;
          },
          onChanged: (passVal) {
            password = passVal;
          },
        ),
      ),
    );
  }
}
