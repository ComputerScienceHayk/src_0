import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

String text = """ 
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum".
""";

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: fullW * 0.90,
            height: fullH * 0.10,
            alignment: Alignment.centerLeft,
            child: Text(
              "Privacy policy",
              style: TextStyle(
                  fontSize: fullW * 0.09,
                  color: Theme.of(context).primaryColor),),
          ),
          Card(
            elevation: 2.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(fullW * 0.2),
            ),
            child: Container(
              width: fullW * 0.90,
              height: fullH * 0.55,
              padding: EdgeInsets.all(fullW * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(fullW * 0.04),
                color: whiteC,
              ),
              alignment: Alignment.centerLeft,
              child: Text(text, style: TextStyle(fontSize: fullW * 0.045),),
            ),
          ),
        ],
      ),
    );
  }
}
