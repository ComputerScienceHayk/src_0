import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/widgets/referrals_page/referrals_list.dart';

import '../theme.dart';

class ReferralsPage extends StatelessWidget {
  const ReferralsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return  Container(
      width: fullW,
      height: fullH,
      alignment: Alignment.center,
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: fullW * 0.90,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.05,),
            child: Text(
              getTranslated(context, "referrals"),
              style: TextStyle(
                  fontSize: fullW * 0.09,
                  color: Theme.of(context).primaryColor),),
          ),
          ReferralsList(),
        ],
      ),
    );
  }
}
