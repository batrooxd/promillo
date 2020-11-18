import 'package:promillo/drinks.dart';

//Hilfsfunktion welche die Namen der Getränke in eine Liste schreibt
drinksToList() {
  List<String> listDrinks = [];
  for (int i = 0; i < drinks.length; i++) {
    listDrinks.add(drinks[i].name);
  }
  return listDrinks;
}
