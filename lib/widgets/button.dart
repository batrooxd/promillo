import 'package:flutter/material.dart';
import 'package:promillo/widgets/promille.dart';

/// This is the stateless widget that the main application instantiates.
class MyButtonWidget extends StatelessWidget {
  MyButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              //print("hi");
              //incrementCounter();
            },
            child: const Text('Hinzufügen', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
