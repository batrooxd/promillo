import 'package:flutter/material.dart';
import 'package:promillo/widgets/dropdown.dart';
import 'package:promillo/widgets/dropdown2.dart';
import 'package:promillo/widgets/promille.dart';

class MyMainTabWidget extends StatelessWidget {
  //MyMainTabWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              //padding: EdgeInsets.all(10),
              //color: Colors.lightGreen,
              //child: Text('Alkoholgehalt des Getränks'),
              //child: MyPromilleDisplayWidget(),
              ),
          Container(
            //padding: EdgeInsets.all(10),
            //color: Colors.lightGreen,
            //child: Text('Das gewählte Getränk'),
            child: MyDropdownWidget2(),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.lightGreen,
            child: Text('Ein Button'),
          ),
        ],
      ),
    );
  }
}
