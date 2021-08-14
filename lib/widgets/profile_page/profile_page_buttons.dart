import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/fonts.dart';

// ignore: must_be_immutable
class ProfilePageButtons extends StatelessWidget {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    navBloc = BlocProvider.of<NavigationBloc>(context);

    return Container(
      width: fullW * 0.90,
      padding: EdgeInsets.only(bottom: fullH * 0.0196),
      // height: fullH * 0.367,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(fullW * 0.10),
          topRight: Radius.circular(fullW * 0.10),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: fullH * 0.05 ,),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
              width: fullW * 0.80,
              height: fullH * 0.30,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(fullW * 0.04),
              ),
            ),
              Positioned(
                bottom: fullH * 0.22,
                child: Container(
                  width: fullW * 0.80,
                  height: fullH * 0.05,
                  alignment: Alignment.center,
                  child: Text(
                    "Current Bonuses: 650",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: fullW * 0.065, fontWeight: FontWeight.bold,),
                  ),
                ),
              ),
              Positioned(
                top: fullH * 0.10,
                child: Container(
                  width: fullW * 0.90,
                  height: fullH * 0.18,
                  child: Stack(
                    children: [
                      Positioned(
                        right: fullW * 0.49,
                        child: InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            shadowColor: Colors.white,
                            elevation: 2.0,
                            child: Container(
                              width: fullW * 0.36,
                              height: fullH * 0.18,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    MyFlutterApp.invite_friends_btn,
                                    size: fullW * 0.10,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    "Invite friends",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: fullW * 0.050,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: fullW * 0.48,
                        child: InkWell(
                          onTap: () {
                            navBloc.add(NavigationEvent.suggestCompanyPage);
                          },
                          child: Card(
                            elevation: 2.0,
                            child: Container(
                              width: fullW * 0.36,
                              height: fullH * 0.18,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    MyFlutterApp.suggest_company_btn,
                                    size: fullW * 0.10,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    "Suggest company",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: fullW * 0.055,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: fullH * 0.29,
                  child: Container(
                    width: fullW * 0.10,
                    height: fullH * 0.02,
                    color: Colors.white,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
