import 'package:flutter/material.dart';
import 'package:loyalty/fonts.dart';
import 'package:loyalty/utils/custom_expansion_tile.dart' as custom;

class CurrentCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
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
                'Are you sure you want to \n delete this card?',
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
                        // navBloc.add(NavigationEvent.addNewCardPage);
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
          Container(
            width: fullW * 0.80,
            alignment: Alignment.centerLeft,
            child: Text(
              "Adidas",
              style: TextStyle(
                fontSize: fullW * 0.04,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Card(
            elevation: 2.0,
            child: Container(
              width: fullW * 0.35,
              height: fullH * 0.30,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Free_logo.svg/600px-Free_logo.svg.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Points:5"),
          Container(
            width: fullW * 0.20,
            height: fullH * 0.15,
            child: Image.network(
              "https://banner2.cleanpng.com/20180330/axw/kisspng-barcode-scanners-codabar-international-article-num-barcode-5abe215dc87b09.6654178415224098218212.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullW * 0.03,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.02),
            ),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.white,
              iconColor: Colors.black,
              title: Row(
                children: [
                  Icon(
                    MyFlutterApp.info,
                    size: fullW * 0.05,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: fullW * 0.05,
                  ),
                  Text(
                    "Card info",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: fullW * 0.90,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: fullH * 0.02,
                    bottom: fullH * 0.03,
                  ),
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.
 ''',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullW * 0.03,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.02),
            ),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.white,
              iconColor: Colors.black,
              title: Row(
                children: [
                  Icon(
                    MyFlutterApp.add_card_btn,
                    size: fullW * 0.05,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: fullW * 0.05,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: fullW * 0.90,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: fullH * 0.02,
                    bottom: fullH * 0.03,
                  ),
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.
 ''',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullW * 0.03,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.02),
            ),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.white,
              iconColor: Colors.black,
              title: Row(
                children: [
                  Icon(
                    MyFlutterApp.delivery,
                    size: fullW * 0.05,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: fullW * 0.05,
                  ),
                  Text(
                    "Delivery",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: fullW * 0.90,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: fullH * 0.02,
                    bottom: fullH * 0.03,
                  ),
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.
 ''',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullW * 0.03,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.02),
            ),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.white,
              iconColor: Colors.black,
              title: Row(
                children: [
                  Icon(
                    MyFlutterApp.percent,
                    size: fullW * 0.05,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: fullW * 0.05,
                  ),
                  Text(
                    "Stocks",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: fullW * 0.90,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: fullH * 0.02,
                    bottom: fullH * 0.03,
                  ),
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.
 ''',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
              left: fullW * 0.05,
              right: fullW * 0.05,
              bottom: fullW * 0.03,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.02),
            ),
            child: custom.ExpansionTile(
              headerBackgroundColor: Colors.white,
              iconColor: Colors.black,
              title: Row(
                children: [
                  Icon(
                    MyFlutterApp.donate,
                    size: fullW * 0.05,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: fullW * 0.05,
                  ),
                  Text(
                    "Donate",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  width: fullW * 0.90,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: fullH * 0.02,
                    bottom: fullH * 0.03,
                  ),
                  child: Text(
                    ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.
 ''',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: createNewCard,
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.only(
                left: fullW * 0.05,
                right: fullW * 0.05,
                bottom: fullW * 0.03,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(fullW * 0.02),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: fullW * 0.03,
                ),
                height: fullH * 0.065,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(
                      MyFlutterApp.trash_btn,
                      size: fullW * 0.05,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: fullW * 0.05,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: fullW * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
