import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/fonts.dart';
import 'package:loyalty/theme.dart';

import '../constants.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    final NavigationBloc _bottomNavBloc =
        BlocProvider.of<NavigationBloc>(context);

    return BlocBuilder(
        bloc: _bottomNavBloc,
        builder: (_counterBloc, name) {
          return Container(
            width: fullW,
            height: fullH * 0.20,
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
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(appBarRadius,),
               bottomRight: Radius.circular(appBarRadius,)
             ),
             border: Border.all(color: Colors.transparent, width: 0.001,),
           ),
            padding: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              top: fullH * 0.05,
              bottom: fullH * 0.05,
            ),
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: fullW * 0.12,
                    height: fullH * 0.20,
                    alignment: Alignment.center,
                    child: Icon(
                      MyFlutterApp.logo,
                      size: fullW * 0.12,
                    )),
                Container(
                  width: fullW * 0.55,
                  height: fullH * 0.20,
                  alignment: Alignment.center,
                  child: Container(
                    width: fullW * 0.55,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      scrollPadding: EdgeInsets.only(top: fullH * 0.20),
                      keyboardType: TextInputType.text,
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                          counterStyle: TextStyle(color: Colors.white,),
                          hintText: "Search",
                          focusColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: fullW * 0.055,
                          ),
                          focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: statusBarC),
                            borderRadius: BorderRadius.circular(fullW * 0.035),
                          ),
                          fillColor: statusBarC,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(fullW * 0.035),
                            // borderSide: BorderSide(color: statusBarC),
                          ),
                          helperStyle: TextStyle(color: statusBarC),
                          labelStyle:
                              TextStyle(color: Colors.white,),
                          prefixIcon: IconButton(
                            icon: Icon(
                              MyFlutterApp.search_btn,
                              color: whiteC,
                              size: fullW * 0.062,
                            ),
                            onPressed: () {
                              // search
                            },
                          ),
                          suffixStyle:
                              TextStyle(color: Colors.white,),),
                      onChanged: (String value) {
                        searchValue = value.toLowerCase();
                      },
                    ),
                  ),
                ),
                Container(
                  width: fullW * 0.12,
                  height: fullH * 0.20,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      context
                          .read<NavigationBloc>()
                          .add(NavigationEvent.notifications);
                    },
                    child: Icon(
                      MyFlutterApp.notification_btn,
                      color: whiteC,
                      size: fullW * 0.10,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
