import 'package:promillo/classes/drinks.dart';

//Hilfsfunktion welche die Namen der Getränke in eine Liste schreibt
drinksToList() {
  List<String> listDrinks = [];
  for (int i = 0; i < drinks.length; i++) {
    listDrinks.add(drinks[i].name);
  }
  return listDrinks;
}

//Hilfsfunktion welche den Akoholgehalt eines Getränks zurückgibt
giveMeVolume(String drinkName) {
  String myDrinkName;
  for (int i = 0; i < drinks.length; i++) {
    if (drinks[i].name == drinkName) {
      myDrinkName = drinks[i].volume.toString();
    }
  }
  return myDrinkName;
}
