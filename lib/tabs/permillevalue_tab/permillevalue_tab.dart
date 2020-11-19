import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

//int counter = 0;

/// This is the stateful widget that the main application instantiates.
class MyPermilleValueWidget extends StatefulWidget {
  //MyPermilleValueWidget({Key key}) : super(key: key);

  @override
  _MyPermilleValueWidget createState() => _MyPermilleValueWidget();
  // method() => createState()._methodInPage2();
}

/// This is the private State class that goes with MyStatefulWidget.
///
class _MyPermilleValueWidget extends State<MyPermilleValueWidget> {
  //methodInPage2() => print("method in page 2");

  @override
  Widget build(BuildContext context) {
    //return Center(
    return Consumer<DrinkList>(builder: (context, drinklist, _) {
      return ListView.builder(
          itemCount: drinklist.meineDrinkListe.length,
          itemBuilder: (context, index) {
            var d = drinklist.meineDrinkListe[index];
            return ListTile(
              title: Text(d.name),
              subtitle: Text(d.volume.toString()),
            );
          });
    });
  }
}
