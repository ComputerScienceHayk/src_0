import 'package:flutter/material.dart';
import 'package:loyalty/theme.dart';

class NewCouponButton extends StatefulWidget {
  const NewCouponButton({Key key}) : super(key: key);

  @override
  _NewCouponButtonState createState() => _NewCouponButtonState();
}

class _NewCouponButtonState extends State<NewCouponButton> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW * 0.90,
      height: fullH * 0.08,
      padding: EdgeInsets.only(left: fullW * 0.05, right: fullW * 0.05,),
      decoration: BoxDecoration(
        color: whiteC,
        borderRadius: BorderRadius.circular(fullW * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("New coupon", style: TextStyle(fontSize: fullW * 0.05),),
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
                print(_isSwitched);
              });
            },
            activeTrackColor: statusBarC,
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
