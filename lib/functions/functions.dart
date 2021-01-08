import 'package:promillo/classes/drinks.dart';
//import 'package:promillo/classes/person.dart';

//Hilfsfunktion welche die Namen der Getränke in eine Liste schreibt
drinksToList() {
  List<String> listDrinks = [];
  for (int i = 0; i < drinks.length; i++) {
    listDrinks.add(drinks[i].name);
  }
  return listDrinks;
}

giveMeVolume(String drinkName) {
  String myDrinkName;
  for (int i = 0; i < drinks.length; i++) {
    if (drinks[i].name == drinkName) {
      myDrinkName = drinks[i].volume.toString();
    }
  }
  return myDrinkName;
}

// test() {
//   var robert =
//       new Person(name: "robert", alter: 30, gewicht: 90, geschlecht: "m");

//   print(robert.alter);
// }
