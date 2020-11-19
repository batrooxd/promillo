import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:promillo/main.dart';

class MyPermilleValueWidget extends StatefulWidget {
  @override
  _MyPermilleValueWidget createState() => _MyPermilleValueWidget();
}

class _MyPermilleValueWidget extends State<MyPermilleValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkList>(
      builder: (context, drinklist, _) {
        return SizedBox(
          height: 200,
          child: Container(
            color: Colors.lightBlue,
            child: ListView.builder(
              itemCount: drinklist.meineDrinkListe.length,
              itemBuilder: (context, index) {
                var d = drinklist.meineDrinkListe[index];
                return ListTile(
                  title: Text(d.name),
                  subtitle: Text('${d.volume.toString()} Vol. -%'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
