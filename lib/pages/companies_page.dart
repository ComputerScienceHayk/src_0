import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/widgets/companies_page/companies_list.dart';
import 'package:loyalty/widgets/companies_page/filter_button.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Scaffold(
      body: Container(
        width: fullW,
        height: fullH,
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: fullW * 0.90,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.05,),
              child: Row(
                children: [
                  Text(
                    getTranslated(context, "companies"),
                    style: TextStyle(
                        fontSize: fullW * 0.09,
                        color: Theme.of(context).primaryColor),),
                  FilterButton(),
                ],
              ),
            ),
            CompaniesList(),
          ],
        ),
      ),
    );
  }
}
