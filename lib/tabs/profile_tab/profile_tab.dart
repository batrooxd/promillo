import 'package:flutter/material.dart';

//Input decoration
_inputDecoration(label) => InputDecoration(
      labelText: label,
      fillColor: Colors.red,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(18.0),
          borderSide: new BorderSide()),
    );

// Define a custom Form widget.
class WeightFormWidget extends StatefulWidget {
  @override
  _WeightFormState createState() => _WeightFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _WeightFormState extends State<WeightFormWidget> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final weightController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
        TextField(
          controller: weightController,
          decoration: _inputDecoration("Gewicht"),
        ),
        TextField(
          controller: weightController,
          decoration: _inputDecoration("Alter"),
        ),
      ]),
      floatingActionButton: RaisedButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("Folgende Daten erfolgreich gespeichert:" +
                    weightController.text),
              );
            },
          );
        },
        child: Text("Speichern"),
      ),
    );
  }
}
