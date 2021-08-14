import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/fonts.dart';

// ignore: must_be_immutable
class AddNewCard extends StatelessWidget {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    navBloc = BlocProvider.of<NavigationBloc>(context);

    return Container(
      width: fullW,
      height: fullH,
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
          Container(
            width: fullW,
            height: fullH * 0.15,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
            ),
            child: Text(
              "Add new card",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: fullW * 0.065,
              ),
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.08,
            margin: EdgeInsets.only(
              top: fullH * 0.01,
              bottom: fullH * 0.01,
            ),
            child: Card(
              shadowColor: Colors.white,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      size: fullW * 0.065,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
                  Container(
                    width: fullW * 0.70,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sas supermarket",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: fullW * 0.045,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.08,
            margin: EdgeInsets.only(
              top: fullH * 0.01,
              bottom: fullH * 0.01,
            ),
            child: Card(
              shadowColor: Colors.white,
              elevation: 1.0,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.check,
                        size: fullW * 0.065,
                        color: Colors.grey[200],
                      ),
                      onPressed: () {}),
                  Container(
                    width: fullW * 0.70,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card  number",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: fullW * 0.045,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.08,
            margin: EdgeInsets.only(
              top: fullH * 0.01,
              bottom: fullH * 0.01,
            ),
            child: Card(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.02),
              ),
              shadowColor: Colors.white,
              elevation: 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        MyFlutterApp.scan_btn,
                        size: fullW * 0.065,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                  Container(
                    width: fullW * 0.70,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Scan",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: fullW * 0.045,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
