import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../theme.dart';

class RecoveryInput extends StatelessWidget {
  final phoneController = TextEditingController(text: "$phone");

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      margin: EdgeInsets.only(
          left: fullW * 0.05,
          right: fullW * 0.05,
          top: fullH * 0.10,
          bottom: fullH * 0.08),
      child: TextFormField(
        scrollPadding: EdgeInsets.only(top: fullH * 0.20),
        keyboardType: TextInputType.phone,
        controller: phoneController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: whiteC),
              borderRadius: BorderRadius.circular(fullW * 0.035),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(fullW * 0.035),
            ),
            fillColor: whiteC,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fullW * 0.035),
              borderSide: BorderSide(color: whiteC),
            ),
            hintText: "type your phone number",
            helperText: '+374 xx xxx xxx',
            helperStyle: TextStyle(color: whiteC),
            labelText: "Phone",
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            prefixIcon: Icon(
              Icons.phone_android,
              color: Theme.of(context).primaryColor,
            ),
            suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
        maxLength: 12,
        validator: (String value) {

          if (phone == "" || phone == null || value.isEmpty) {
            return "Phone number is Required";
          } else if (phone.length != 12) {
            return "Phone number is not valid(short)";
          } else {
            return null;
          }

        },
        onChanged: (phoneVal) {
          phone = phoneVal;
          // articleBloc.add(AuthCheckedEvent());
        },
      ),
    );
  }
}
