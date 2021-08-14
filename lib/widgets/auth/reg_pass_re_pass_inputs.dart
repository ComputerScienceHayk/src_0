import 'package:flutter/material.dart';
import 'package:loyalty/theme.dart';

import '../../constants.dart';

class RegPassRePassInputs extends StatefulWidget {
  @override
  _RegPassRePassInputsState createState() => _RegPassRePassInputsState();
}

class _RegPassRePassInputsState extends State<RegPassRePassInputs> {

final _passwordController = TextEditingController(); // get name input text
final _confirmPassController = TextEditingController(); // get name input text

  bool _obscureText = true;
  bool _showPassword0 = false;
  bool _showPassword1 = false;

  String _repeatPassVal;

  // Toggles the password show status
  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: fullW * 0.05,
            right: fullW * 0.05,
            top: fullH * 0.03,),
          child: TextFormField(
            obscureText: !this._showPassword0,
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _passwordController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this._showPassword0 ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => this._showPassword0 = !this._showPassword0);
                  },
                ),
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
                helperStyle: TextStyle(color: whiteC),
                labelText: "Password",
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              // passwords must have at least one special character
              bool passValid = RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*").hasMatch(value);

              if (value.isEmpty || value.length == 0) {
                return "Password  is Required";
              } else if (!passValid || value.length < 6) {
                return "Password is weak";

              }
              return null;
            },
            onChanged: (passVal) {
              password = passVal;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: fullW * 0.05,
            right: fullW * 0.05,
            top: fullH * 0.03,),
          child: TextFormField(
            obscureText: !this._showPassword1,
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _confirmPassController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: this._showPassword1 ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => this._showPassword1 = !this._showPassword1);
                  },
                ),
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
                helperStyle: TextStyle(color: whiteC),
                labelText: "Repeat password",
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty || value.length == 0) {
                return "Phone number is Required";
              } else if (password != _repeatPassVal) {
                return "Passwords must match";
              }

              return null;
            },
            onChanged: (passVal) {
              _repeatPassVal = passVal;
            },
          ),
        ),
      ],
    );
  }
}
