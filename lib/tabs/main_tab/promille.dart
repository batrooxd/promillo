import 'package:flutter/material.dart';

//Widget zur Anzeige des Promillewerts
class MyPromilleDisplayWidget extends StatefulWidget {
  @override
  _MyPromilleDisplayWidgetState createState() =>
      _MyPromilleDisplayWidgetState();
}

class _MyPromilleDisplayWidgetState extends State<MyPromilleDisplayWidget> {
  String volume = '5 Vol. -%';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(volume),
    );
  }
}
