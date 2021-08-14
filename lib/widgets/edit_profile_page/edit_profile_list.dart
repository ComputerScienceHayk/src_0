import 'package:flutter/material.dart';

import '../../theme.dart';

class EditProfileList extends StatefulWidget {

  @override
  _EditProfileListState createState() => _EditProfileListState();
}

class _EditProfileListState extends State<EditProfileList> {

  final _nameController = TextEditingController();
  final _surNameController = TextEditingController();
  final _sexController = TextEditingController();
  final _birthDayController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();


  var _controller = TextEditingController(text: 'Customer help');


  final List<Map<String, dynamic>> subjects = [
    {
      'value': '1',
      'label': 'Customer help',
      'icon': Icon(Icons.help_center_outlined, color: statusBarC),
      'textStyle': TextStyle(color: statusBarC),
    },
    {
      'value': '2',
      'label': 'New partner',
      'icon': Icon(Icons.account_box, color: statusBarC),
      'textStyle': TextStyle(color: statusBarC),
    },
    {
      'value': '3',
      'label': 'Developers support',
      //'enable': false,
      'textStyle': TextStyle(color: statusBarC),
      'icon': Icon(Icons.contact_support, color: statusBarC),
    },
  ];
  @override
  void initState() {

    _controller = TextEditingController(text: '1');

    _getValue();
    super.initState();

  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = 'circleValue';
        _controller.text = '1';
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    Widget space = SizedBox(
      height: fullH * 0.030
    );

    return Container(
      width: fullW * 0.90,
      height: fullH * 0.70,
      child: ListView(
        children: [
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _surNameController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Surname",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _sexController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Sex",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: fullW * 0.09,
                  onPressed: _getValue,
                  color: Theme.of(context).primaryColor,
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _birthDayController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Birth day",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _phoneController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Phone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              if (value.isEmpty) {
                return "Phone number is Required";
              } else if (value.length == 0) {
                return "Phone number is Required";
              } else if (value.length != 12) {
                return "Phone number is not valid";
              }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.streetAddress,
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
          TextFormField(
            style: TextStyle(color: Theme.of(context).primaryColor),
            scrollPadding: EdgeInsets.only(top: fullH * 0.20),
            keyboardType: TextInputType.text,
            controller: _emailController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: fullW * 0.05, top: fullH * 0.02, bottom: fullH * 0.02),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: statusBarC),
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                ),
                fillColor: whiteC,
                filled: true,
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(fullW * 0.035),
                  borderSide: BorderSide(color: statusBarC),
                ),
                helperStyle: TextStyle(color: whiteC),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                suffixStyle: TextStyle(color: Theme.of(context).primaryColor)),
            validator: (String value) {
              // if (value.isEmpty) {
              //   return "Phone number is Required";
              // } else if (value.length == 0) {
              //   return "Phone number is Required";
              // } else if (value.length != 12) {
              //   return "Phone number is not valid";
              // }

              return null;
            },
            // onFieldSubmitted: (String value) {
            //   phoneNumber = value;
            // },
          ),
          space,
        ],
      ),
    );
  }
}
