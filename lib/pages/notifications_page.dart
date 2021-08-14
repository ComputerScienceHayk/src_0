import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/widgets/notifications_page/notifications_buttons.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key key}) : super(key: key);

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
            margin: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.05,),
            child: Text(
              getTranslated(context, "notifications"),
              style: TextStyle(
                  fontSize: fullW * 0.09,
                  color: Theme.of(context).primaryColor),),
          ),
          NotificationsButtons(),
        ],
      ),
    );
  }
}
