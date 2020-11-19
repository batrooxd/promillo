import 'package:flutter/material.dart';
import 'package:promillo/classes/drink.dart';
import 'package:promillo/classes/drinks.dart';
import 'package:promillo/functions/functions.dart';
import 'package:promillo/tabs/permillevalue_tab/permillevalue_tab.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

/// This is the stateful widget that the main application instantiates.
class MyDropdownWidget2 extends StatefulWidget {
  //MyDropdownWidget2({Key key}) : super(key: key);

  @override
  _MyDropdownWidgetState2 createState() => _MyDropdownWidgetState2();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyDropdownWidgetState2 extends State<MyDropdownWidget2> {
  //String dropdownValue = 'Bier 0.3 l';
  //String volumeValue = '0.5';
  Drink selectedDrink = drinks[0];
  List<String> listWithDrinks = drinksToList();

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkList>(builder: (context, drinklist, _) {
      //alles unterhalb kann jetzt auf drinklist zugreifen
      return Center(
        child: Column(
          children: [
            Container(
              child: Text('${selectedDrink.volume} Vol. -%'),
            ),
            DropdownButton<Drink>(
              value: selectedDrink,
              iconSize: 24,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 0,
              ),
              onChanged: (Drink drink) {
                //String newVolume = giveMeVolume(newValue);
                setState(() {
                  selectedDrink = drink;
                  //volumeValue = newVolume;
                  //
                });
              },
              items: drinks.map<DropdownMenuItem<Drink>>((Drink drink) {
                return DropdownMenuItem<Drink>(
                  value: drink,
                  child: Text(drink.name),
                );
              }).toList(),
            ),
            FlatButton(
              color: Color(0xff3D3D3D),
              textColor: Colors.white,
              child: Text("Hinzufügen"),
              onPressed: () {
                drinklist.adddrink(selectedDrink);
              },
              //onPressed: () => MyPermilleValueWidget().method(),
            ),
            SizedBox(
              height: 200,
              child: Container(
                child: MyPermilleValueWidget(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
