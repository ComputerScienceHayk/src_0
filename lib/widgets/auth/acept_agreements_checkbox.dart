import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../constants.dart';
import '../../theme.dart';

class CkeckBoxOfAgreements extends StatefulWidget {
  @override
  _CkeckBoxOfAgreementsState createState() => _CkeckBoxOfAgreementsState();
}

class _CkeckBoxOfAgreementsState extends State<CkeckBoxOfAgreements> {
  bool submittable() {
    return agreedToTOS;
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    //final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () => _setAgreedToTOS(!agreedToTOS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Theme(
                child: Checkbox(
                  checkColor: Theme.of(context).primaryColor,
                  //fillColor: MaterialState.disabled(),
                  activeColor: whiteC,
                  value: agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                data: ThemeData(
                  unselectedWidgetColor: whiteC, // Your color
                ),
              ),
              Text(
                "I agree to the",
                style: TextStyle(color: whiteC),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new WebviewScaffold(
                          url: privacyUrl,
                          appBar: AppBar(
                            title: Text(
                              "terms of use",
                              style: TextStyle(
                                color: whiteC,
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          withJavascript: true,
                          withLocalStorage: true,
                          withZoom: true,
                          clearCache: true,
                          appCacheEnabled: true,
                          // initialChild: Container(
                          //   child: Center(
                          //     child: LoadingIndicator(),
                          //   ),
                          // ),
                        ))),
                child: Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Text(
                    "terms of use",
                    style: TextStyle(
                      color: whiteC,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  "and",
                  style: TextStyle(color: whiteC),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new WebviewScaffold(
                          url: privacyUrl,
                          appBar: AppBar(
                            title: Text("Privacy"),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          withJavascript: true,
                          withLocalStorage: true,
                          withZoom: true,
                          clearCache: true,
                          appCacheEnabled: true,
                          // initialChild: Container(
                          //   child: Center(
                          //     child: LoadingIndicator(),
                          //   ),
                          // ),
                        ))),
                child: Text(
                  "privacy policy",
                  style: TextStyle(
                    color: whiteC,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )),
    ); // privacy and terms of use;
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      agreedToTOS = newValue;
    });
  }
}
