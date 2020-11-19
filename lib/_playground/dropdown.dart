import 'package:flutter/material.dart';
import 'package:promillo/functions/functions.dart';

/// This is the stateful widget that the main application instantiates.
class MyDropdownWidget extends StatefulWidget {
  //MyDropdownWidget({Key key}) : super(key: key);

  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyDropdownWidgetState extends State<MyDropdownWidget> {
  String dropdownValue = 'Bier 0.3 l';
  List<String> listWithDrinks = drinksToList();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      //icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      //elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 0,
        //color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: listWithDrinks.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
