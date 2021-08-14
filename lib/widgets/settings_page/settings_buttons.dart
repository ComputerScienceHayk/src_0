import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/fonts.dart';
import 'package:loyalty/pages/auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../theme.dart';

class SettingsButtons extends StatelessWidget {
  const SettingsButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    Future<bool> logOutAlert() {
      return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 12.0,
                actionsPadding: EdgeInsets.only(
                  left: fullW * 0.10,
                  right: fullW * 0.10,
                  bottom: fullH * 0.10
                ),
                contentPadding: EdgeInsets.only(
                  left: fullW * 0.10,
                  right: fullW * 0.10,
                  top: fullH * 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.08),
                ),
                // title: Text('Are you sure?'),
                content: Text(
                  'Are you sure want to \n log out ?',
                  style: TextStyle(fontSize: fullW * 0.065),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  Container(
                    width: fullW * 0.55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Container(
                            width: fullW * 0.20,
                            height: fullH * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                fullW * 0.02,
                              ),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        InkWell(
                          child: Container(
                            width: fullW * 0.20,
                            height: fullH * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                fullW * 0.02,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () async {
                            Navigator.of(context).pop(true);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("phone");
                            phone = null;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AuthPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ) ??
          false;
    }

    Widget space = SizedBox(width: fullW * 0.04);

    double buttonW = fullW * 0.37;
    double buttonH = fullW * 0.11;

    return BlocBuilder<NavigationBloc, String>(builder: (_, count) {
      return Container(
        width: fullW * 0.90,
        height: fullH * 0.40,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: fullH * 0.08,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, -2.0),
              blurRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: fullW * 0.45,
                height: fullH * 0.40,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: buttonW,
                        height: buttonH,
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.edit_btn,
                              color: statusBarC,
                            ),
                            space,
                            Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: fullW * 0.04,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvent.editPage);
                      },
                    ),
                    InkWell(
                        child: Container(
                          width: buttonW,
                          height: buttonH,
                          child: Row(
                            children: [
                              Icon(
                                MyFlutterApp.support_btn,
                                color: statusBarC,
                              ),
                              space,
                              Text(
                                "Support",
                                style: TextStyle(
                                  fontSize: fullW * 0.04,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          context
                              .read<NavigationBloc>()
                              .add(NavigationEvent.supportPage);
                        }),
                    InkWell(
                        child: Container(
                          width: buttonW,
                          height: buttonH,
                          child: Row(
                            children: [
                              Icon(
                                MyFlutterApp.lang_btn,
                                color: statusBarC,
                              ),
                              space,
                              Text(
                                "Language",
                                style: TextStyle(
                                  fontSize: fullW * 0.04,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          context
                              .read<NavigationBloc>()
                              .add(NavigationEvent.langPage);
                        }),
                    InkWell(
                        child: Container(
                          width: buttonW,
                          height: buttonH,
                          child: Row(
                            children: [
                              Icon(
                                MyFlutterApp.companies_btn,
                                color: statusBarC,
                              ),
                              space,
                              Text(
                                "Companies",
                                style: TextStyle(
                                  fontSize: fullW * 0.04,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          context
                              .read<NavigationBloc>()
                              .add(NavigationEvent.companiesPage);
                        }),
                    InkWell(
                        child: Container(
                          width: buttonW,
                          height: buttonH,
                          child: Row(
                            children: [
                              Icon(
                                MyFlutterApp.log_out_btn,
                                color: statusBarC,
                              ),
                              space,
                              Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: fullW * 0.04,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          logOutAlert();
                        }),
                  ],
                )),
            Container(
              width: fullW * 0.45,
              height: fullH * 0.40,
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      width: buttonW,
                      height: buttonH,
                      child: Row(
                        children: [
                          Icon(
                            MyFlutterApp.rate_btn,
                            color: statusBarC,
                          ),
                          space,
                          Text(
                            "Rate",
                            style: TextStyle(
                              fontSize: fullW * 0.04,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      child: Container(
                        width: buttonW,
                        height: buttonH,
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.app_info_btn,
                              color: statusBarC,
                            ),
                            space,
                            Text(
                              "App info",
                              style: TextStyle(
                                fontSize: fullW * 0.04,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvent.appInfoPage);
                      }),
                  InkWell(
                      child: Container(
                        width: buttonW,
                        height: buttonH,
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.referrals_btn,
                              color: statusBarC,
                            ),
                            space,
                            Text(
                              "Referrals",
                              style: TextStyle(
                                fontSize: fullW * 0.04,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvent.referralsPage);
                      }),
                  InkWell(
                      child: Container(
                        width: buttonW,
                        height: buttonH,
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.nots_btn,
                              color: statusBarC,
                            ),
                            space,
                            Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: fullW * 0.04,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvent.notificationsSettingsPage);
                      }),
                  InkWell(
                      child: Container(
                        width: buttonW,
                        height: buttonH,
                        child: Row(
                          children: [
                            Icon(
                              MyFlutterApp.privacy_btn,
                              color: statusBarC,
                            ),
                            space,
                            Text(
                              "Privacy policy",
                              style: TextStyle(
                                fontSize: fullW * 0.04,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context
                            .read<NavigationBloc>()
                            .add(NavigationEvent.privacyPage);
                      }),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
