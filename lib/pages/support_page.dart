import 'package:flutter/material.dart';
import 'package:loyalty/fonts.dart';
import 'package:loyalty/localization/consts.dart';
import 'package:loyalty/theme.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:url_launcher/url_launcher.dart';


class SupportPage extends StatefulWidget {
  const SupportPage({Key key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {

  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  var _controller = TextEditingController(text: 'Customer help');

  //String _initialValue;
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = 'Customer help';

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

  static const _kFontFam = 'MyFlutterIcons';
  static const String _kFontPkg = null;

  final _bodyController = TextEditingController(text: '');

  Widget _buildBody() {
    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;
    return Container(
      padding: EdgeInsets.only(left: 25, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        textAlignVertical: TextAlignVertical(y: 1.0),
        controller: _bodyController,
        minLines: 10,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: new InputDecoration(
            alignLabelWithHint: true,
            hintStyle: TextStyle(
                color: Colors.black
            ),
            contentPadding: EdgeInsets.only(top: 30.0,left: 20.0, right: 5.0, bottom: 20.0),
            focusedErrorBorder:new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(fullW * 0.03),
            ),
            focusedBorder:new OutlineInputBorder(
                borderRadius: BorderRadius.circular(fullW * 0.03),
                borderSide: new BorderSide(color: Colors.black)
            ),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(fullW * 0.03),
                borderSide: new BorderSide(color: Colors.black)
            ),
            labelText: 'Type your message',
            labelStyle: TextStyle(
                color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            suffixStyle: TextStyle(color: Colors.black)
        ),
        maxLength: null,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Body is Required';
          }

          return null;
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    final fullW = MediaQuery.of(context).size.width * 1.00;
    final fullH = MediaQuery.of(context).size.height * 1.00;

    return Form(
      key: _oFormKey,
      child: Container(
        color: Color(0xffF4F4F4),
        child: ListView(
          children: [
            Container(
              width: fullW * 0.90,
              height: fullH * 0.10,
              margin: EdgeInsets.only(top: fullH * 0.04, left: 20, bottom: fullH * 0.02),
              alignment: Alignment.centerLeft,
              child: Text(
                getTranslated(context, "support"),
                style: TextStyle(
                    fontSize: fullW * 0.09,
                    color: Theme.of(context).primaryColor),),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: SelectFormField(
                //type: SelectFormFieldType.dialog,
                controller: _controller,
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(left: 25.0),
                    focusedErrorBorder:new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black)
                    ),
                    focusedBorder:new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(fullW * 0.03),
                        borderSide: new BorderSide(color: Colors.black)
                    ),
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(fullW * 0.03),
                        borderSide: new BorderSide(color: Colors.black)
                    ),
                    labelStyle: TextStyle(
                        color: statusBarC
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: statusBarC,
                      size: fullW * 0.10,
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
            ), // Subject
            _buildBody(), // Body
            Container(
              width: fullW * 0.90,
              height: fullH * 0.20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: toMail,
                    child: Container(
                      width: fullW * 0.35,
                      height: fullH * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(fullW * 0.02)
                      ),
                      child: Icon(MyFlutterApp.email, color: Colors.white, size: fullW * 0.10,),
                    ),
                  ),
                  InkWell(
                    onTap: toWhatsApp,
                    child: Container(
                      width: fullW * 0.35,
                      height: fullH * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(fullW * 0.02)
                      ),
                      child: Icon(
                        MyFlutterApp.whats_app,
                        size: fullW * 0.10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  toMail() async{

    String subjectText =  _valueSaved;
    String bodyText = _bodyController.text;
    String mail = 'mailto:support@allin.am?subject=$subjectText&body=$bodyText';

    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw 'Could not launch $mail';
    }
  }

  toWhatsApp() async{
    String subjectText =  _valueSaved;
    String bodyText = _bodyController.text;
    String whatsApp = 'https://wa.me/37455919599?text=$subjectText $bodyText';

    if (await canLaunch(whatsApp)) {
      await launch(whatsApp);
    } else {
      throw 'Could not launch $whatsApp';
    }
  }

}
