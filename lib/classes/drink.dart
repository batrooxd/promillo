// Datenklasse für Getränke (Bier, Wein, ...)
class Drink {
  String name;
  double volume; // volume percentage
  int quantity; // in milliliters

  //Konstruktor
  Drink({
    this.name,
    this.volume,
    this.quantity,
  });
}

//Datenklasse für eine Trinkaktion
class DrinkAction {
  Drink drink;
  DateTime time;

  //Konstruktor
  DrinkAction({this.drink}) {
    this.time = DateTime.now();
  }
}
