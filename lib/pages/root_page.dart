import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/pages/app_info_page.dart';
import 'package:loyalty/pages/cards_page.dart';
import 'package:loyalty/pages/companies_page.dart';
import 'package:loyalty/pages/coupons_page.dart';
import 'package:loyalty/pages/coupons_read_more.dart';
import 'package:loyalty/pages/create_my_card_page.dart';
import 'package:loyalty/pages/current_card_page.dart';
import 'package:loyalty/pages/filter_page.dart';
import 'package:loyalty/pages/lang_change_page.dart';
import 'package:loyalty/pages/notifications_page.dart';
import 'package:loyalty/pages/privacy_policy.dart';
import 'package:loyalty/pages/profile_page.dart';
import 'package:loyalty/pages/referrals_page.dart';
import 'package:loyalty/pages/settings_page.dart';
import 'package:loyalty/pages/suggest_company_page.dart';
import 'package:loyalty/pages/support_page.dart';
import 'package:loyalty/widgets/app_bar.dart';
import 'package:loyalty/widgets/bottom_nav.dart';
import 'package:loyalty/widgets/notifications_window.dart';

import '../constants.dart';
import 'add_new_card.dart';
import 'edit_profile_page.dart';
import 'home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    final NavigationBloc _bottomNavBloc =
        BlocProvider.of<NavigationBloc>(context);
    final ScrollController scrollController = ScrollController();

    navBloc = BlocProvider.of<NavigationBloc>(context);

    Future<bool> _onBackPressed() {
      // goBack(context);
      return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to exit an App'),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              );
            },
          ) ??
          false;
    }

    return BlocBuilder(
        bloc: _bottomNavBloc,
        builder: (_counterBloc, name) {
          return WillPopScope(
            onWillPop: _onBackPressed,
            child: Container(
              width: fullW,
              height: fullH,
              color: Colors.white,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.bottomRight,
              //     end: Alignment.topLeft,
              //     transform: GradientRotation(10 / 4),
              //     colors: [
              //       Color(0xff3925A1),
              //       Color(0xff671499),
              //     ],
              //   ),
              // ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: _bottomNavBloc.appBarExist == false
                    ? PreferredSize(
                        preferredSize: Size.fromHeight(0.0001),
                        child: Container(
                          height: 0.0001,
                        ),
                      )
                    : AppBar(
                        elevation: appBarElevation,
                        titleSpacing: 0.0,
                        leadingWidth: 0.0,
                        automaticallyImplyLeading: false,
                        toolbarHeight: fullH * 0.20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(appBarRadius),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        title: CustomAppBar(),
                      ),
                body: Container(
                  width: fullW,
                  height: fullH,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      transform: GradientRotation(10 / 4),
                      colors: [
                        scrolledUp == true ? Colors.white: Color(0xff3925A1),
                        scrolledUp == true ? Colors.white: Color(0xff671499),
                      ],
                    ),
                  ),
                  child: NotificationListener(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        name == "home"
                            ? HomePage()
                            : name == "profile"
                                ? ProfilePage()
                                : name == "coupons"
                                    ? CouponsPage()
                                    : name == "cards"
                                        ? CardsPage()
                                        : name == "notifications"
                                            ? NotificationsWindow()
                                            : name == "settings"
                                                ? SettingsPage()
                                                : name == "edit_page"
                                                    ? EditProfilePage()
                                                    : name == "support_page"
                                                        ? SupportPage()
                                                        : name == "lang_page"
                                                            ? LangChangePage()
                                                            : name ==
                                                                    "companies_page"
                                                                ? CompaniesPage()
                                                                : name ==
                                                                        "privacy_page"
                                                                    ? PrivacyPolicy()
                                                                    : name ==
                                                                            "notifications_settings_page"
                                                                        ? NotificationsPage()
                                                                        : name ==
                                                                                "referrals_page"
                                                                            ? ReferralsPage()
                                                                            : name == "app_info_page"
                                                                                ? AppInfo()
                                                                                : name == "suggest_company_page"
                                                                                    ? SuggestCompanyPage()
                                                                                    : name == "create_my_card_page"
                                                                                        ? CreateMyCardPage()
                                                                                        : name == "filter_page"
                                                                                            ? FilterPage()
                                                                                            : name == "add_new_card_page"
                                                                                                ? AddNewCard()
                                                                                                : name == "current_card_page"
                                                                                                    ? CurrentCardPage()
                                                                                                    : name == "coupons_read_more_page"
                                                                                                        ? CouponsReadMore()
                                                                                                        : HomePage(),
                      ],
                    ),
                    onNotification: (notificationInfo) {
                      if (scrollController.offset >=
                                  scrollController.position.maxScrollExtent &&
                              !scrollController.position.outOfRange ||
                          notificationInfo is ScrollUpdateNotification) {
                        setState(() {
                          appBarRadius = 50;
                          appBarElevation = 1.0;
                          scrolledUp = true;
                        });
                        print("1");
                      }
                      if (scrollController.offset <=
                              scrollController.position.minScrollExtent &&
                          !scrollController.position.outOfRange) {
                        setState(() {
                          appBarRadius = 0.0;
                          appBarElevation = 0.0;
                          scrolledUp = false;
                        });
                        print("2");
                      }

                      return true;
                    },
                  ),
                ),
                bottomNavigationBar: BottomNavigation(),
              ),
            ),
          );
        });
  }
}
