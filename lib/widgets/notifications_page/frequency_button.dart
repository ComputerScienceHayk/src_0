import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../theme.dart';

class FrequencyButton extends StatefulWidget {
  @override
  _FrequencyButtonState createState() => _FrequencyButtonState();
}

class _FrequencyButtonState extends State<FrequencyButton> {


  var _controller = TextEditingController(text: 'Customer help');

  @override
  void initState() {

    _controller = TextEditingController(text: '1');

    _getValue();
    super.initState();

  }


  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = 'Customer help';

  final List<Map<String, dynamic>> subjects = [
    {
      'value': '1',
      'label': '',
      'icon': null,
      'textStyle': null,
    },
    {
      'value': '2',
      'label': 'New partner',
      'icon': Icon(Icons.account_box, color: Colors.red),
      'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': '3',
      'label': 'Developers support',
      //'enable': false,
      'textStyle': TextStyle(color: Colors.red),
      'icon': Icon(Icons.contact_support, color: Colors.red),
    },
  ];

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
        children: [
          Text("Frequency", style: TextStyle(color: statusBarC, fontSize: fullW * 0.05),),
          Container(
            width: fullW * 0.10,
            child: SelectFormField(
              //type: SelectFormFieldType.dialog,
              controller: _controller,
              decoration: new InputDecoration(
                  // focusedErrorBorder:new OutlineInputBorder(
                  //     borderSide: new BorderSide(color: Colors.black)
                  // ),
                  // focusedBorder:new OutlineInputBorder(
                  //     borderSide: new BorderSide(color: Colors.black)
                  // ),
                  // border: new OutlineInputBorder(
                  //     borderSide: new BorderSide(color: Colors.black)
                  // ),
                  // labelStyle: TextStyle(
                  //   color: Theme.of(context).primaryColor,
                  // ),
                  fillColor: whiteC,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: statusBarC,
                    size: fullW * 0.08,
                  ),
                  suffixStyle:  TextStyle(color: Colors.black)),
              //initialValue: _initialValue,
              changeIcon: true,
              dialogTitle: 'Pick a item',
              dialogCancelBtn: 'CANCEL',
              enableSearch: true,
              items: subjects,
              onChanged: (val) => setState(() => _valueChanged = val),
              validator: (val) {
                setState(() => _valueToValidate = val);
                return null;
              },
              onSaved: (val) => setState(() => _valueSaved = val),
            ),
          ),
        ],
      )
    );
  }
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = 'circleValue';
        _controller.text = '1';
      });
    });
  }
}
