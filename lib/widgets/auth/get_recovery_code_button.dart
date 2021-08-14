import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/pages/auth_page.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../constants.dart';
import '../../theme.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class GetRecoverCodeButton extends StatefulWidget {
  @override
  _GetRecoverCodeButtonState createState() => _GetRecoverCodeButtonState();
}

class _GetRecoverCodeButtonState extends State<GetRecoverCodeButton> {
  final _recoveryForm = GlobalKey<FormState>();

  bool showMe = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SmsAutoFill smsAutoFill = SmsAutoFill();
  String strVerificationId;
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController smsEditingController = TextEditingController();
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return InkWell(
      onTap: phoneAlert,
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
          "GET RECOVERY CODE",
          style: TextStyle(color: whiteC),
        ),
      ),
    );
  }

  phoneAlert() {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        elevation: 1.0,
        scrollable: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fullW * 0.08),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        content: Container(
          margin: EdgeInsets.only(
            left: fullW * 0.05,
            right: fullW * 0.05,
          ),
          width: fullW * 0.70,
          height: fullH * 0.30,
          child: Form(
            key: _recoveryForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  //controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
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
                      helperStyle: TextStyle(color: whiteC),
                      labelText: "Verification code",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      suffixStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                  onChanged: (String value) {},
                ),
                TextFormField(
                  //controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
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
                      helperStyle: TextStyle(color: whiteC),
                      labelText: "New password",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      suffixStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                  onChanged: (String value) {},
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: fullW * 0.01, right: fullW * 0.01),
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(fullW * 0.02),
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
                    child: Text(
                      "APPLY",
                      style: TextStyle(
                        color: whiteC,
                      ),
                    ),
                  ),
                  onTap: getPhoneCode,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getPhoneCode() async {
    useDialog();

    var urlP = Uri.parse("https://api.allin.am/user/check-phone");

    var data = {"phone": phone};

    var _res = await http.post(urlP, body: data);

    final message = json.decode(_res.body);

    print("recovery message");
    print(message);

    if (_res.statusCode == 200) {
      if (message["response"] == "Entered phone does not exist") {
        return "phone does not exist";
      } else if (message["response"] == "ok") {
        phoneNumberVerification();
      }
    }
  }

  Future useDialog() {
    final newPasswordController = TextEditingController();

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text("Password recovery"),
        content: Container(
          height: fullH * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                //controller: smsEditingController,
                decoration:
                    const InputDecoration(labelText: 'Verification code'),
              ),
              Container(
                height: fullH * 0.20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: newPasswordController,
                      decoration:
                          const InputDecoration(labelText: 'new password'),
                    ),
                    InkWell(
                      onTap: () async {
                        var url = Uri.parse(
                            "https://api.allin.am/user/change-password");

                        var data = {
                          "phone": phone,
                          "password": newPasswordController.text
                        };

                        print("newPasswordSend");
                        print(data);

                        await http.post(url, body: data);

                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => AuthPage()));
                      },
                      child: Container(
                          width: fullW * 0.25,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.circular(fullW * 0.02)),
                          alignment: Alignment.center,
                          child:
                              Text("ok", style: TextStyle(color: Colors.red))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void displayMessage(String message) {
    // ignore: deprecated_member_use
    globalKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId,
        smsCode: smsEditingController.text,
      );

      final User user =
          (await firebaseAuth.signInWithCredential(credential)).user;

      displayMessage("Successfully signed in UID: ${user.uid}");

      setState(() {
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    } catch (e) {
      displayMessage("Failed to sign in: " + e.toString());
    }
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
      useDialog();
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
}
