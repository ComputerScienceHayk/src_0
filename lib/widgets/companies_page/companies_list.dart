import 'package:flutter/material.dart';

import '../../theme.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({Key key}) : super(key: key);

  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  bool _isSwitched = true;

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: fullW * 0.40,
                          child: Row(
                            children: [
                              Image.network("https://www.logodesign.net/logo/abstract-cuboid-building-4519ld.png"),
                              Text("Name"),
                            ],
                          ),
                        ),
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
