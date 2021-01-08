import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

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
  //Reset(Cancel)
  _resetForm(DrinkList drinkList) => RaisedButton(
      onPressed: () {
        //weightController.clear();
      },
      child: Text("Formular zurücksetzen"));

  _inputWeightField(DrinkList drinkList) => TextFormField(
        decoration: _inputDecoration("Gewicht"),
        style: _textStyle(),
        keyboardType: TextInputType.number,
        initialValue: drinkList.gewicht.toString(),
        //controller: weightController,
        onChanged: (value) {
          drinkList.setWeight(int.parse(value));
        },
      );

  //Radio button (Gender)
  _genderRadio(
    DrinkList drinkList,
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
                groupValue: drinkList.geschlecht,
                onChanged: handleRadioValueChanged),
            Text(
              "Männlich",
              style: new TextStyle(
                fontSize: 14.0,
              ),
            ),
            Radio(
                value: 1,
                groupValue: drinkList.geschlecht,
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

  //final weightController = TextEditingController();

  // final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(8.0),
            child: Consumer<DrinkList>(builder: (context, drinklist, _) {
              return ListView(
                children: <Widget>[
                  _genderRadio(drinklist, (value) {
                    drinklist.setGender(value);
                  }),
                  SizedBox(
                    height: 8.0,
                  ),
                  _inputWeightField(drinklist),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [_resetForm(drinklist)])
                ],
              );
            })));
  }
}
