import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CouponsReadMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
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
      child: ListView(
        children: [
          SizedBox(
            height: fullH * 0.02,
          ),
          Container(
            width: fullW,
            height: fullH * 0.15,
            padding: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: fullW * 0.30,
                  height: fullH * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sushi Lab",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: fullW * 0.06,
                            fontWeight: FontWeight.bold),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(fullW * 0.015),
                        ),
                        child: Container(
                          width: fullW * 0.14,
                          height: fullH * 0.035,
                          alignment: Alignment.center,
                          child: Text(
                            "Food",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: fullW * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: fullH * 0.15,
                  padding: EdgeInsets.only(
                    top: fullH * 0.03,
                  ),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    color: Theme.of(context).primaryColor,
                    size: fullW * 0.065,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: fullW,
            padding: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullH * 0.02,
            ),
            height: fullH * 0.32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: fullW * 0.35,
                  height: fullH * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(
                      fullW * 0.02,
                    ),
                    border: Border.all(
                      color: Colors.grey[300],
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.image,
                    size: fullW * 0.35,
                    color: Colors.grey[100],
                  ),
                ),
                Container(
                  width: fullW * 0.52,
                  height: fullH * 0.30,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: fullH * 0.145,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(
                            fullW * 0.02,
                          ),
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.image,
                          size: fullW * 0.25,
                          color: Colors.grey[300],
                        ),
                      ),
                      Container(
                        height: fullH * 0.145,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(
                            fullW * 0.02,
                          ),
                          border: Border.all(
                            color: Colors.grey[300],
                          ),
                        ),
                        child: Icon(
                          Icons.image,
                          size: fullW * 0.25,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: fullW,
            height: fullH * 0.10,
            padding: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: fullW * 0.60,
                  height: fullH * 0.10,
                  child: Column(
                    children: [
                      Text("4.3 astxer 26 reviews"),
                      Text("Valid until 18.10.2021 18:00"),
                      Text("Uses by 32 users"),
                    ],
                  ),
                ),
                Container(
                  width: fullW * 0.15,
                  height: fullH * 0.10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(fullW * 0.02),
                      ),
                      child: Container(
                        width: fullW * 0.10,
                        height: fullH * 0.05,
                        alignment: Alignment.center,
                        child: Icon(Icons.share),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: fullW * 0.80,
            padding: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
            ),
            alignment: Alignment.center,
            child: Text(
                """ It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. """,
              style: TextStyle(
                fontSize: fullW * 0.045,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: fullW,
            height: fullH * 0.15,
            alignment: Alignment.center,
            child: InkWell(
              child: Container(
                width: fullW * 0.80,
                height: fullW * 0.10,
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
                  "Use",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fullW * 0.04,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
