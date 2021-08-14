import 'package:flutter/material.dart';
import 'package:loyalty/theme.dart';

import '../../constants.dart';
import '../../fonts.dart';

class RegNameInput extends StatefulWidget {
  @override
  _RegNameInputState createState() => _RegNameInputState();
}

class _RegNameInputState extends State<RegNameInput> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      margin: EdgeInsets.only(
        left: fullW * 0.05,
        right: fullW * 0.05,
        top: fullH * 0.10,
      ),
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).primaryColor),
        scrollPadding: EdgeInsets.only(top: fullH * 0.20),
        keyboardType: TextInputType.text,
        controller: phoneController,
        decoration: InputDecoration(
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
            labelText: "Name",
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            prefixIcon: Icon(
              MyFlutterApp.name,
              color: Theme.of(context).primaryColor,
            ),
            suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
        validator: (String value) {
          if (value.isEmpty || value.length == 0) {
            return "Name  is Required";
          }  else if (value.length < 2) {
            return "Name  is not valid";
          }

          return null;
        },
        onChanged: (nameVal) {
          name = nameVal;
        },
      ),
    );
  }
}
