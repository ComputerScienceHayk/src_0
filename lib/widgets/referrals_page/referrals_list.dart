import 'package:flutter/material.dart';

import '../../theme.dart';


class ReferralsList extends StatelessWidget {
  const ReferralsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      width: fullW,
      height: fullH * 0.75,
      alignment: Alignment.center,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Container(
              width: fullW * 0.90,
              height: fullH * 0.12,
              child: Column(
                children: [
                  SizedBox(height: fullH * 0.02,),
                  Container(
                    width: fullW * 0.90,
                    height: fullH * 0.08,
                    decoration: BoxDecoration(
                      color: whiteC,
                      borderRadius: BorderRadius.circular(fullW * 0.02),
                    ),
                    alignment: Alignment.center,
                    child: RichText(
                      text: new TextSpan(
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'Name Last Name /',
                              style: TextStyle(
                                  color: Color(0xff453855), fontSize: fullW * 0.045)),
                          new TextSpan(
                              text: 'id:01234194120301',
                              style: new TextStyle(color: inActive,  fontSize: fullW * 0.045)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: fullH * 0.02,
                  )
                ],
              ),
            );
          }),
    );
  }
}
