import 'package:flutter/material.dart';
import 'package:loyalty/widgets/coupons_page/coupons_filter.dart';
import 'package:loyalty/widgets/coupons_page/coupons_list.dart';

// ignore: must_be_immutable
class CouponsPage extends StatelessWidget {

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
      alignment: Alignment.center,
      child: Column(
        children: [
          CouponsFilter(),
          CouponsList(),
        ],
      ),
    );
  }
}
