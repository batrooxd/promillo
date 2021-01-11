import 'package:flutter/material.dart';

//Widget mit Einstellungen (noch nicht implementiert)

class MySettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          color: Color(0xff3D3D3D),
          child: SizedBox(
            height: 50,
            width: 300,
            child: Center(
              child: Text('Benachrichtigungen',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          color: Color(0xff3D3D3D),
          child: SizedBox(
            height: 50,
            width: 300,
            child: Center(
              child: Text('Kontakt', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          color: Color(0xff3D3D3D),
          child: SizedBox(
            height: 50,
            width: 300,
            child: Center(
              child: Text('Impressum', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
