import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';

// ignore: must_be_immutable
class CouponsList extends StatelessWidget {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    navBloc = BlocProvider.of<NavigationBloc>(context);

    Widget space = SizedBox(
      height: fullH * 0.01,
    );

    return Container(
      width: fullW * 0.90,
      height: fullH * 0.534,
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++)
            Column(
              children: [
                space,
                InkWell(
                  onTap: () {
                    navBloc.add(NavigationEvent.couponsReadMorePage);
                  },
                  child: Card(
                    elevation: 1.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    child: Container(
                      width: fullW * 0.90,
                      height: fullH * 0.434,
                      padding: EdgeInsets.only(top: fullH * 0.01, bottom: fullH * 0.01),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            width: fullW * 0.80,
                            height: fullH * 0.19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(fullW * 0.02),
                            ),
                            child: Image.network(
                              "https://saleslist.allin.am/Assets/images/homepage/h1.png",
                              fit: BoxFit.cover,
                              width: fullW * 0.80,
                            ),
                          ),
                          Container(
                            width: fullW * 0.80,
                            height: fullH * 0.10,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Teghenis Holiday Home",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: fullW * 0.04),
                                ),
                                Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Chevron_Logo.svg/512px-Chevron_Logo.svg.png",
                                  width: fullW * 0.10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: fullW * 0.80,
                            height: fullH * 0.05,
                            alignment: Alignment.center,
                            child: Text("Valid until 12.09.2021 17:0$i", style: TextStyle(fontSize: fullW * 0.03, color: Colors.black45),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  navBloc.add(NavigationEvent.couponsReadMorePage);
                                },
                                child: Container(
                                  width: fullW * 0.40,
                                  height: fullH * 0.065,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(fullW * 0.02),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  child: Text("More"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  navBloc.add(NavigationEvent.couponsReadMorePage);
                                },
                                child: Container(
                                  width: fullW * 0.40,
                                  height: fullH * 0.065,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(fullW * 0.02),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Text("Use", style: TextStyle(color: Colors.white,),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                space,
              ],
            ),
        ],
      ),
    );
  }
}
