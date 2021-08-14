import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';
import 'package:loyalty/fonts.dart';

// ignore: must_be_immutable
class CreateMyCardPage extends StatelessWidget {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    navBloc = BlocProvider.of<NavigationBloc>(context);
    createNewCard() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 12.0,
            contentPadding: EdgeInsets.only(
              left: fullW * 0.02,
              right: fullW * 0.02,
              top: fullH * 0.05,
              // bottom: fullH * 0.05,
            ),
            actionsPadding: EdgeInsets.only(
              // left: fullW * 0.02,
              // right: fullW * 0.02,
              // top: fullH * 0.05,
              bottom: fullH * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.08),
            ),
            title: Container(
              width: fullW * 0.85,
              height: fullH * 0.20,
              alignment: Alignment.center,
              child: Text(
                'Are you sure you want to \n create a new card?',
                style: TextStyle(
                  fontSize: fullW * 0.045,
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                width: fullW * 0.85,
                alignment: Alignment.center,
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
                        navBloc.add(NavigationEvent.addNewCardPage);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
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
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: fullW * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cards",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: fullW * 0.065,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            MyFlutterApp.filter_btn,
                            size: fullW * 0.065,
                          ),
                          onPressed: () {
                            navBloc.add(NavigationEvent.filterPage);
                          }),
                    ],
                  ),
                ),
                InkWell(
                  onTap: createNewCard,
                  child: Container(
                    width: fullW * 0.40,
                    height: fullH * 0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        transform: GradientRotation(10 / 4),
                        colors: [
                          Color(0xff3925A1),
                          Color(0xff62169A),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(fullW * 0.025),
                    ),
                    child: Text(
                      "Add new card",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fullW * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < 4; i++)
            Container(
              width: fullW * 0.90,
              height: fullH * 0.08,
              padding: EdgeInsets.only(
                left: fullW * 0.04,
              ),
              margin: EdgeInsets.only(
                top: fullH * 0.01,
                bottom: fullH * 0.01,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffDDDDDD)),
                borderRadius: BorderRadius.circular(fullW * 0.02),
                color: Colors.white,
              ),
              child: Card(
                shadowColor: Colors.white,
                elevation: 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: fullW * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: fullW * 0.12,
                            child: Image.network(
                              "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Suslik Style",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: fullW * 0.045,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.check,
                          size: fullW * 0.065,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
