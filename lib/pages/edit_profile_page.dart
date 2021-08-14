import 'package:flutter/material.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/widgets/edit_profile_page/apply_button.dart';
import 'package:loyalty/widgets/edit_profile_page/edit_profile_list.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
        width: fullW,
        height: fullH,
        color: Color(0xffF4F4F4),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: fullW * 0.90,
                height: fullH * 0.10,
                margin: EdgeInsets.only(top: fullH * 0.05),
                alignment: Alignment.centerLeft,
                child: Text(getTranslated(context, "edit_profile"), style: TextStyle(color: Theme.of(context).primaryColor, fontSize: fullW * 0.07),),
              ),
              EditProfileList(),
              ApplyButton(),
            ],
          ),
        ),
      );
  }
}
