import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty/fonts.dart';
import '../../bloc/navigation_bloc.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fullW = MediaQuery.of(context).size.width * 1.00;

    return BlocBuilder<NavigationBloc, String>(builder: (_, count) {
      return IconButton(
        icon: Icon(MyFlutterApp.settings_btn, size: fullW * 0.080, color: Colors.white,),
        onPressed: () {
          context.read<NavigationBloc>().add(NavigationEvent.settings);
        },
      );
    });
  }
}
