import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/pages/root_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../theme.dart';

class VerificationCodeInput extends StatefulWidget {
  const VerificationCodeInput({Key key}) : super(key: key);

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {

  TextEditingController textEditingController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  StreamController<ErrorAnimationType> errorController;

  String smsCode = "";
  bool wrongPass;

  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;

  bool hasError = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Scaffold(
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
          ),
        ),
        child: Column(
          children: [
            Container(
                width: fullW,
                height: fullH * 0.15,
                margin: EdgeInsets.only(top: fullH * 0.10),
                alignment: Alignment.center,
                child: Text(
                  "Please type the verification code \n sent to $phone",
                  style: TextStyle(
                    fontSize: fullW * 0.050,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  //obscuringCharacter: '*',
                  // obscuringWidget: FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 3) {
                      return "Wrong code";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 0.0,
                    borderRadius: BorderRadius.circular(fullW * 0.035),
                    fieldHeight: fullH * 0.075,
                    fieldWidth: fullW * 0.12,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Color(0xffC4C4C4),
                    selectedFillColor: Colors.white,
                    //inactiveColor: ,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    // BoxShadow(
                    //   offset: Offset(0, 1),
                    //   color: Colors.black12,
                    //   blurRadius: 10,
                    // )
                  ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      smsCode = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
            InkWell(
              child: Container(
                height: fullH * 0.05,
                alignment: Alignment.center,
                child: Text(
                  "Resend code >",
                  style: TextStyle(
                    fontSize: fullW * 0.045,
                    color: statusBarC,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                checkSms();
                if (wrongPass != true) {

                  if ( regStatus ==
                      "added successfully") {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => RootPage()));
                    keepSession();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            "Something went wrong, please try again"),
                      ),
                    );
                  }
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
                  "Verification",
                  style: TextStyle(color: whiteC, fontSize: fullW * 0.065),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkSms() async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      smsCode: smsCode, verificationId: '',
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("successful");
      setState(() {
        wrongPass = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        setState(() {
          wrongPass = true;
        });
      }
    } catch (e) {
      print("wtf ?");
    }
  }

  keepSession() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
  }
}
