import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loyalty/pages/root_page.dart';
import 'package:loyalty/pages/auth_page.dart';
import 'package:loyalty/pages/onboarding_page.dart';
import 'package:loyalty/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/navigation_bloc.dart';
import 'constants.dart';
import 'localization/consts.dart';
import 'localization/localizations.dart';

bool isFirstRun;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  phone = prefs.getString('phone');
  await prefs.setBool("isFirstRun", true);
  isFirstRun = prefs.getBool("isFirstRun");
  runApp(LoyaltyApp());

  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Test(),
  // ));
}

class LoyaltyApp extends StatefulWidget {
  const LoyaltyApp({Key key}) : super(key: key);

  @override
  _LoyaltyAppState createState() => _LoyaltyAppState();
}

class _LoyaltyAppState extends State<LoyaltyApp> with WidgetsBindingObserver {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseMessaging messaging;

  Future<void> _getFCMToken() async {
    // Go to Firebase console -> Project settings -> Cloud Messaging -> Web Push Certificates -> create key pair -> copy and paste
    const yourVapidKey =
        "BNkC-EswsEV7ODKwrSXHp1mV_KRnSoQuRBCbGY2JY-3XJYtTaxfVjWD7UgjqyzQXqWT4Bv99hV1q-r9-kRQVI0o";
    String token =
        await FirebaseMessaging.instance.getToken(vapidKey: yourVapidKey);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token);

    print('_FCMToken is $token');

    if (Platform.isIOS) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   createDynamicLink0();
    // });
    _initialization.whenComplete(() {
      messaging = FirebaseMessaging.instance;
      _getFCMToken();
    });
  }

  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarC,
      statusBarIconBrightness: Brightness.light,
      //systemNavigationBarColor: redC,
      //systemNavigationBarDividerColor: Colors.green
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
      ],
      child: AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: [
            Locale("en", "US"),
            Locale("ru", "RU"),
            Locale("am", "AM"),
          ],
          localizationsDelegates: [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: isFirstRun == true
              ? OnBoardingPage()
              : phone == null
                  ? AuthPage()
                  : phone != null
                      ? RootPage()
                      : AuthPage(),
        ),
      ),
    );
  }
}
