import 'package:flutter/material.dart';

class FavoriteCompanies extends StatelessWidget {
  const FavoriteCompanies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH * 0.18,
      margin: EdgeInsets.only(left: fullW * 0.04, right: fullW * 0.04),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
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
          );
        },
      ),
    );
  }
}
