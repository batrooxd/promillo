import 'package:flutter/material.dart';

_inputDecoration(label) => InputDecoration(
      labelText: label,
      fillColor: Colors.red,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(18.0),
          borderSide: new BorderSide()),
    );

class UserDataWidget extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserDataWidget> {
  int weightValue = 0;
  int genderValue = 0;
  int ageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        TextField(
            decoration: _inputDecoration("Gewicht"),
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() => weightValue = 0);
              } else {
                setState(() {
                  weightValue = int.parse(value);
                });
              }
            }),
        TextField(
            decoration: _inputDecoration("Geschlecht"),
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() => genderValue = 0);
              } else {
                setState(() {
                  genderValue = int.parse(value);
                });
              }
            }),
        TextField(
            decoration: _inputDecoration("Alter"),
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() => ageValue = 0);
              } else {
                setState(() {
                  ageValue = int.parse(value);
                });
              }
            }),
        Text("${weightValue + genderValue + ageValue}")
      ])),
    );
  }
}
