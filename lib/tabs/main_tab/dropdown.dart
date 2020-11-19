import 'package:flutter/material.dart';
import 'package:promillo/classes/drink.dart';
import 'package:promillo/classes/drinks.dart';
import 'package:provider/provider.dart';
import 'package:promillo/main.dart';

class MyDropdownWidget2 extends StatefulWidget {
  @override
  _MyDropdownWidgetState2 createState() => _MyDropdownWidgetState2();
}

class _MyDropdownWidgetState2 extends State<MyDropdownWidget2> {
  Drink selectedDrink = drinks[0];

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkList>(builder: (context, drinklist, _) {
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
                setState(() {
                  selectedDrink = drink;
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
            ),
          ],
        ),
      );
    });
  }
}
