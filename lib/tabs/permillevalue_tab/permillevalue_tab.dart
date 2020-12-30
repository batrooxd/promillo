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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Dein aktueller Promillewert beträgt:",
                  style: TextStyle(fontSize: 20)),
            ),
            Center(
              child: SizedBox(
                height: 75,
                width: 150,
                child: Container(
                  child: Center(
                    child: Text(drinklist.permillechecker(),
                        style: TextStyle(fontSize: 20)),
                  ),
                  color: drinklist.givemecolor(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                drinklist.drivecarchecker(),
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(
              height: 250,
              child: Container(
                child: ListView.builder(
                  itemCount: drinklist.meineDrinkListe.length,
                  itemBuilder: (context, index) {
                    var d = drinklist.meineDrinkListe[index];
                    return ListTile(
                      title: Text(d.name),
                      subtitle: Text(d.time.toString()),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
