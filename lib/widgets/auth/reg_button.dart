import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/constants.dart';
import 'package:loyalty/pages/reg_page.dart';
import 'package:loyalty/widgets/auth/verification_code_input.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../theme.dart';

// ignore: must_be_immutable
class RegButton extends StatefulWidget {
  @override
  _RegButtonState createState() => _RegButtonState();
}

class _RegButtonState extends State<RegButton> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SmsAutoFill smsAutoFill = SmsAutoFill();

  String strVerificationId;

  final globalKey = GlobalKey<ScaffoldState>();


  bool showVerifyNumberWidget = true;

  bool showVerificationCodeWidget = false;

  bool showSuccessWidget = false;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return InkWell(
      onTap: () {
        if (agreedToTOS == true) {
          if (regFormKey.currentState.validate()) {
            phoneNumberVerification();

            Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => VerificationCodeInput()));


          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("please fill correct all inputs"),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("please agree with the terms to sign up *"),
            ),
          );
        }
      },
      child: Container(
        width: fullW * 0.90,
        height: fullH * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(fullW * 0.04),
          border: Border.all(color: whiteC, width: 1.5),
        ),
        alignment: Alignment.center,
        child: Text(
          "Registration",
          style: TextStyle(color: whiteC, fontSize: fullW * 0.065),
        ),
      ),
    );
  }

  Future<void> phoneNumberVerification() async {
    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
      displayMessage(
          "Phone number is automatically verified and user signed in: ${firebaseAuth.currentUser.uid}");
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      displayMessage(
          'Phone number verification is failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int forceResendingToken]) async {
      displayMessage('Please check your phone for the verification code.');
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      displayMessage("verification code: " + verificationId);
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 20),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      displayMessage("Failed to Verify Phone Number: $e");
    }
  }

  void displayMessage(String message) {
    globalKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 5), codeSent: (String verificationId, int forceResendingToken) {

      },
        // verificationCompleted: phoneVerificationCompleted,
        // verificationFailed: phoneVerificationFailed,
        // codeSent: phoneCodeSent,
        // codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout
      );
    } catch (e) {
      displayMessage("Failed to Verify Phone Number: $e");
    }
  }

}
