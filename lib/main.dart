import 'package:flutter/material.dart';
import 'package:promillo/widgets/dropdown.dart';
import 'package:promillo/widgets/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promillo'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.green,
                //child: MyHomePage(),
                child: Text("Hier Promille anzeigen 123"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.green,
                child: MyDropdownWidget(),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.green,
                child: MyButtonWidget(),
                //child: Text("Hier Promille anzeigen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
