import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Color Converter
_hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

//TextStyle
_textStyle() => TextStyle(color: _hexToColor("#000000"), fontSize: 14.0);

//InputDecoration
_inputDecoration(label) => InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(18.0),
        borderSide: new BorderSide()));

class ProfileFormWidget extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<ProfileFormWidget> {
  int _gender = -1;

  //Submit(Raised Button)
  _submitForm() => RaisedButton(
        onPressed: () async {
          print(weightController.text);
          print(_gender);
          var sharedPrefs = await SharedPreferences.getInstance();
          sharedPrefs.setInt("weight", int.parse(weightController.text));
          sharedPrefs.setInt("gender", (_gender));
        },
        child: Text("Speichern"),
      );

  //Reset(Cancel)
  _resetForm() =>
      RaisedButton(onPressed: () {}, child: Text("Formular zurücksetzen"));

  _inputWeightField() => TextFormField(
        decoration: _inputDecoration("Gewicht"),
        style: _textStyle(),
        keyboardType: TextInputType.number,
        controller: weightController,
      );

  //Radio button (Gender)
  _genderRadio(
    int _gender,
    handleRadioValueChanged,
  ) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(
          'Geschlecht',
          style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 0,
                groupValue: _gender,
                onChanged: handleRadioValueChanged),
            Text(
              "Männlich",
              style: new TextStyle(
                fontSize: 14.0,
              ),
            ),
            Radio(
                value: 1,
                groupValue: _gender,
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

  final weightController = TextEditingController();
  final genderController = TextEditingController();

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              _genderRadio(_gender, _handleRadioValueChanged),
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
