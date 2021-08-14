import 'package:flutter/material.dart';
import 'package:loyalty/widgets/notifications_page/new_card_button.dart';
import 'frequency_button.dart';
import 'new_company_button.dart';
import 'new_coupon_button.dart';

class NotificationsButtons extends StatelessWidget {
  const NotificationsButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      width: fullW,
      height: fullH * 0.70,
      child: Column(
        children: [
          NewCompanyButton(),
          SizedBox(height: fullH * 0.05,),
          NewCardButton(),
          SizedBox(height: fullH * 0.05,),
          NewCouponButton(),
          SizedBox(height: fullH * 0.15,),
          FrequencyButton(),
        ],
      ),
    );
  }
}
