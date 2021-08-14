import 'package:flutter/material.dart';
import 'package:loyalty/widgets/profile_page/choose_sex_buttons.dart';
import 'package:loyalty/widgets/profile_page/hello_name_banner.dart';
import 'package:loyalty/widgets/profile_page/profile_page_buttons.dart';
import 'package:loyalty/widgets/profile_page/settings_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Container(
      width: fullW,
      height: fullH,
      padding: EdgeInsets.only(left: fullW * 0.05, right: fullW * 0.05),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: fullW,
            height: fullH * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HelloNameBanner(),
                SettingsButton(),
              ],
            ),
          ),
          SizedBox(
            height: fullH * 0.05,
          ),
          ChooseSexButtons(),
          SizedBox(
            height: fullH * 0.0166,
          ),
          ProfilePageButtons(),
        ],
      ),
    );
  }
}
