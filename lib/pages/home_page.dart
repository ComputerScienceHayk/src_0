import 'package:flutter/material.dart';
import 'package:loyalty/widgets/home_page/favorite_companies.dart';
import 'package:loyalty/widgets/home_page/home_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: fullW,
              height: fullH * 0.10,
              padding: EdgeInsets.only(left: fullW * 0.05),
              alignment: Alignment.centerLeft,
              child: Text("My favorite companies",
                style: TextStyle(fontSize: fullW * 0.05, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,),),
            ),
            FavoriteCompanies(),
            HomeButtons(),
          ],
        ),
      ),
    );
  }
}
