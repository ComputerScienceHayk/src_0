import 'package:flutter/material.dart';
import 'package:loyalty/fonts.dart';

import '../theme.dart';

class SuggestCompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    suggestCompany() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 12.0,
            contentPadding: EdgeInsets.only(
              left: fullW * 0.02,
              right: fullW * 0.02,
              top: fullH * 0.05,
              bottom: fullH * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.08),
            ),
            title: Container(
              width: fullW * 0.85,
              height: fullH * 0.20,
              alignment: Alignment.center,
              child: Text(
                'Thank you for suggestion. \n We’ll consider your offer!',
                style: TextStyle(
                  fontSize: fullW * 0.045,
                ),
              ),
            ),
            actions: <Widget>[],
          );
        },
      );
    }

    return Container(
      width: fullW,
      height: fullH,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(fullW * 0.10),
          topRight: Radius.circular(fullW * 0.10),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: fullW,
            height: fullH * 0.05,
            margin: EdgeInsets.only(
              left: fullW * 0.04,
              top: fullH * 0.05,
            ),
            child: Text(
              "Suggest company",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fullW * 0.06,
              ),
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            margin: EdgeInsets.only(
                left: fullW * 0.05,
                right: fullW * 0.05,
                top: fullH * 0.02,
                bottom: fullH * 0.02),
            child: TextFormField(
              style: TextStyle(color: Theme.of(context).primaryColor),
              scrollPadding: EdgeInsets.only(top: fullH * 0.20),
              keyboardType: TextInputType.phone,
              // controller: _phoneController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    left: fullW * 0.06,
                    right: fullW * 0.02,
                    top: fullH * 0.02,
                    bottom: fullH * 0.02,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: whiteC),
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                  ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(fullW * 0.035),
                  // ),
                  fillColor: whiteC,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                    borderSide: BorderSide(color: whiteC),
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MyFlutterApp.building,
                    color: Theme.of(context).primaryColor,
                    size: fullW * 0.08,
                  ),
                  suffixStyle:
                      TextStyle(color: Theme.of(context).primaryColor)),
              // validator: (String value) {
              //
              //   if (phone == "" || phone == null || value.isEmpty) {
              //     return "Phone number is Required";
              //   } else if (phone.length != 12) {
              //     return "Phone number is not valid(short)";
              //   } else {
              //     return null;
              //   }
              //
              // },
              onChanged: (phoneVal) {
                // phone = phoneVal;
                // articleBloc.add(AuthCheckedEvent());
              },
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            margin: EdgeInsets.only(
                left: fullW * 0.05, right: fullW * 0.05, bottom: fullH * 0.02),
            child: TextFormField(
              style: TextStyle(color: Theme.of(context).primaryColor),
              scrollPadding: EdgeInsets.only(top: fullH * 0.20),
              keyboardType: TextInputType.phone,
              // controller: _phoneController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    left: fullW * 0.06,
                    right: fullW * 0.02,
                    top: fullH * 0.02,
                    bottom: fullH * 0.02,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: whiteC),
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                  ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(fullW * 0.035),
                  // ),
                  fillColor: whiteC,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                    borderSide: BorderSide(color: whiteC),
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MyFlutterApp.phone_btn,
                    color: Theme.of(context).primaryColor,
                    size: fullW * 0.08,
                  ),
                  suffixStyle:
                      TextStyle(color: Theme.of(context).primaryColor)),
              // validator: (String value) {
              //
              //   if (phone == "" || phone == null || value.isEmpty) {
              //     return "Phone number is Required";
              //   } else if (phone.length != 12) {
              //     return "Phone number is not valid(short)";
              //   } else {
              //     return null;
              //   }
              //
              // },
              onChanged: (phoneVal) {
                // phone = phoneVal;
                // articleBloc.add(AuthCheckedEvent());
              },
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            margin: EdgeInsets.only(
                left: fullW * 0.05, right: fullW * 0.05, bottom: fullH * 0.02),
            child: TextFormField(
              style: TextStyle(color: Theme.of(context).primaryColor),
              scrollPadding: EdgeInsets.only(top: fullH * 0.20),
              keyboardType: TextInputType.phone,
              // controller: _phoneController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    left: fullW * 0.06,
                    right: fullW * 0.02,
                    top: fullH * 0.02,
                    bottom: fullH * 0.02,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: whiteC),
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                  ),
                  // errorBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red),
                  //   borderRadius: BorderRadius.circular(fullW * 0.035),
                  // ),
                  fillColor: whiteC,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                    borderSide: BorderSide(color: whiteC),
                  ),
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    MyFlutterApp.email,
                    color: Theme.of(context).primaryColor,
                    size: fullW * 0.08,
                  ),
                  suffixStyle:
                      TextStyle(color: Theme.of(context).primaryColor)),
              // validator: (String value) {
              //
              //   if (phone == "" || phone == null || value.isEmpty) {
              //     return "Phone number is Required";
              //   } else if (phone.length != 12) {
              //     return "Phone number is not valid(short)";
              //   } else {
              //     return null;
              //   }
              //
              // },
              onChanged: (phoneVal) {
                // phone = phoneVal;
                // articleBloc.add(AuthCheckedEvent());
              },
            ),
          ),
          InkWell(
            onTap: suggestCompany,
            child: Container(
              width: fullW * 0.90,
              height: fullH * 0.08,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  transform: GradientRotation(10 / 4),
                  colors: [
                    Color(0xff3925A1),
                    Color(0xff62169A),
                  ],
                ),
                borderRadius: BorderRadius.circular(fullW * 0.04),
              ),
              alignment: Alignment.center,
              child: Text(
                "SUGGEST",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fullW * 0.06,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
