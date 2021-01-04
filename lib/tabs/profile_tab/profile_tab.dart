import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Color Converter
_hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

//TextStyle
_textStyle() => TextStyle(color: _hexToColor("#F2A03D"), fontSize: 14.0);

//InputDecoration
_inputDecoration(label) => InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(18.0),
        borderSide: new BorderSide()));

//InputNameText field
_inputAgeField() => TextFormField(
      decoration: _inputDecoration("Alter"),
      style: _textStyle(),
    );

//InputWeightText field
_inputWeightField() => TextFormField(
      decoration: _inputDecoration("Gewicht"),
      style: _textStyle(),
    );

//Radio button (Gender)
_genderRadio(int groupValue, handleRadioValueChanged) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        'Geschlecht',
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Row(
        children: <Widget>[
          Radio(
              value: 0,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Männlich",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
          Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Weiblich",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    ]);

//Submit(Raised Button)
_submitForm() => RaisedButton(
      onPressed: () {},
      child: Text("Speichern"),
    );

//Reset(Caancel)
_resetForm() =>
    RaisedButton(onPressed: () {}, child: Text("Formular zurücksetzen"));

//Shared Preferneces
class SharedPrefs {
  static SharedPreferences _weightPrefs;
  init() async {
    if (_weightPrefs == null) {
      _weightPrefs = await SharedPreferences.getInstance();
    }
  }

  String get userweight => _weightPrefs.getString(keyWeight) ?? "";

  set userweight(String value) {
    _weightPrefs.setString(keyWeight, value);
  }
}

final sharedPrefs = SharedPrefs();
const String keyWeight = "key_weight";

class ProfileFormWidget extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<ProfileFormWidget> {
  int _groupValue = -1;

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              _genderRadio(_groupValue, _handleRadioValueChanged),
              SizedBox(
                height: 8.0,
              ),
              _inputAgeField(),
              SizedBox(
                height: 8.0,
              ),
              _inputWeightField(),
              SizedBox(
                height: 8.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_submitForm(), _resetForm()])
            ],
          )),
    );
  }
}
