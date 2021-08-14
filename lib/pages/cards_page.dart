import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/bloc/navigation_bloc.dart';

// ignore: must_be_immutable
class CardsPage extends StatelessWidget {
  NavigationBloc navBloc;

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    navBloc = BlocProvider.of<NavigationBloc>(context);

    return Container(
      width: fullW,
      height: fullH,
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
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My cards"),
                Icon(Icons.filter),
              ],
            ),
          ),
          Container(
            width: fullW * 0.90,
            height: fullH * 0.50,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (2 / 1),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
               return  InkWell(
                 onTap: () {
                   navBloc.add(NavigationEvent.currentCardPage);
                 },
                 child: Card(
                   elevation: 2.0,
                   color: Color(0xffF1F0FF),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(fullW * 0.02),
                   ),
                   child: Container(
                     width: fullW * 0.44,
                     height: fullH * 0.18,
                     alignment: Alignment.center,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                           width: fullW * 0.40,
                           height: fullH * 0.05,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text(
                                 "Company name",
                                 style: TextStyle(
                                   color: Theme.of(context).primaryColor,
                                   fontSize: fullW * 0.035,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Image.network(
                                 "https://s3.amazonaws.com/pixpa.com/com/articles/1526992650-351865-shutterstock-720198166jpg.png",
                                 width: fullW * 0.10,
                               ),
                             ],
                           ),
                         ),
                         Container(
                           width: fullW * 0.20,
                           height: fullH * 0.05,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               CircleAvatar(
                                 radius: fullW * 0.035,
                                 child: Icon(
                                   Icons.star,
                                   size: fullW * 0.065,
                                   color: Colors.white,
                                 ),
                                 backgroundColor: Color(0xff4324A1),
                               ),
                               Text(
                                 "${index + 650}",
                                 style: TextStyle(
                                   fontSize: fullW * 0.045,
                                 ),
                               )
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               );
              },
            ),
          ),
          InkWell(
            onTap: () {
              navBloc.add(NavigationEvent.createMyCardPage);
            },
            child: Container(
              width: fullW * 0.90,
              height: fullH * 0.10,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(fullW * 0.04),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      transform: GradientRotation(10 / 4),
                      colors: [
                        Color(0xff3925A1),
                        Color(0xff671499),
                      ],
                    ),
                ),
              alignment: Alignment.center,
              child: Text(
                "CREATE MY CARD",
                style: TextStyle(fontSize: fullW * 0.045, color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
