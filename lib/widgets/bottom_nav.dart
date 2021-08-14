import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../fonts.dart';
import '../localization/consts.dart';
import '../theme.dart';


// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> {

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    //final fullH = MediaQuery.of(context).size.height * 1.00;

    final _itemWidth = fullW / 5;
    final _itemHeight = 68.0;

    return BlocBuilder<NavigationBloc, String>(
    builder: (_, count) {
      return BottomAppBar(
        elevation: 2.0,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: _itemWidth,
                  height: _itemHeight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        context.read<NavigationBloc>().add(NavigationEvent.home);
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          MyFlutterApp.home_btn,
                          color: _currentTab == 0 ? Theme.of(context).primaryColor : statusBarC,
                          size: fullW * 0.08,
                        ),
                        _currentTab == 0 ?Text(
                          getTranslated(context, 'home'),
                          style: TextStyle(
                            color: _currentTab == 0 ? Theme.of(context).primaryColor : statusBarC,
                          ),
                        ): SizedBox(width: 0.0, height: 0.0,)
                      ],
                    ),
                  ),
                ), // Home tab
                Container(
                  width: _itemWidth,
                  height: _itemHeight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        context.read<NavigationBloc>().add(NavigationEvent.profile);
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          MyFlutterApp.profile_btn,
                          color: _currentTab == 1 ? Theme.of(context).primaryColor : statusBarC,
                          size: fullW * 0.08,
                        ),
                        _currentTab == 1 ?Text(
                          getTranslated(context, 'profile'),
                          style: TextStyle(
                            color: _currentTab == 1 ? Theme.of(context).primaryColor : statusBarC,
                          ),
                        ): SizedBox(width: 0.0, height: 0.0,),
                      ],
                    ),
                  ),
                ), // Profile tab
                Container(
                  width: _itemWidth,
                  height: _itemHeight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentTab = 2;
                      });

                      // Navigator.of(context).push(new MaterialPageRoute(
                      //     builder: (context) => ScanWindow()));

                    },
                    child: Container(
                      width: _itemWidth,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MyFlutterApp.scan_btn,
                            color: _currentTab == 2 ? Theme.of(context).primaryColor : statusBarC,
                            size: fullW * 0.08,
                          ),
                          _currentTab == 2 ? Text(
                            "Scan",
                            style: TextStyle(
                              color: _currentTab == 2 ? Theme.of(context).primaryColor: statusBarC,
                            ),
                          ): SizedBox(width: 0.0, height: 0.0,),
                        ],
                      ),
                    ),
                  ),
                ), // QR scanner
                Container(
                  width: _itemWidth,
                  height: _itemHeight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        context.read<NavigationBloc>().add(NavigationEvent.coupons);
                        _currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          MyFlutterApp.coupon_btn,
                          color: _currentTab == 3 ? Theme.of(context).primaryColor : statusBarC,
                          size: fullW * 0.08,
                        ),
                        _currentTab == 3 ?Text(
                          getTranslated(context, 'coupon'),
                          style: TextStyle(
                            color: _currentTab == 3 ? Theme.of(context).primaryColor : statusBarC,
                          ),
                        ): SizedBox(width: 0.0, height: 0.0,),
                      ],
                    ),
                  ),
                ), // Coupons tab
                Container(
                  width: _itemWidth,
                  height: _itemHeight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        context.read<NavigationBloc>().add(NavigationEvent.cards);
                        _currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          MyFlutterApp.card_btn,
                          color: _currentTab == 4 ? Theme.of(context).primaryColor : statusBarC,
                          size: fullW * 0.08,
                        ),
                        _currentTab == 4 ? Text(
                          getTranslated(context, 'card'),
                          style: TextStyle(
                            color: _currentTab == 4 ? Theme.of(context).primaryColor : statusBarC,
                          ),
                        ): SizedBox(width: 0.0, height: 0.0,),
                      ],
                    ),
                  ),
                ), // Cards tab
              ],
            ),
          ],
        ),
      );
    });
  }
}
