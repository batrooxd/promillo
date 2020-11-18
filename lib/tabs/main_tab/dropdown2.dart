import 'package:flutter/material.dart';
import 'package:promillo/functions/functions.dart';

/// This is the stateful widget that the main application instantiates.
class MyDropdownWidget2 extends StatefulWidget {
  //MyDropdownWidget({Key key}) : super(key: key);

  @override
  _MyDropdownWidgetState2 createState() => _MyDropdownWidgetState2();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyDropdownWidgetState2 extends State<MyDropdownWidget2> {
  String dropdownValue = 'Bier 0.3 l';
  String volumeValue = '5 Vol. -%';
  List<String> listWithDrinks = drinksToList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Text(volumeValue),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 0,
            ),
            onChanged: (String newValue) {
              String newVolume = giveMeVolume(newValue);
              setState(() {
                dropdownValue = newValue;
                volumeValue = newVolume;
              });
            },
            items: listWithDrinks.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
