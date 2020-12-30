import 'package:flutter/material.dart';
import 'package:promillo/tabs/tabbar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:promillo/tabs/profile_tab/profile_tab.dart';

import 'classes/drink.dart';
import 'classes/person.dart';

import 'functions/functions.dart';

final robert =
    new Person(name: "robert", alter: 30, gewicht: 90, geschlecht: "m");
final geschlecht = myGender(robert.geschlecht);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrinkList()),
      ],
      child: MyTabBar(),
    ),
  );
}

class DrinkList extends ChangeNotifier {
  List<Drink> meineDrinkListe = [];
  double permille = 0;

  adddrink(Drink drink) {
    drink.time = givemedate();
    meineDrinkListe.add(drink);
    addpermille(drink);
    notifyListeners();
  }

  addpermille(Drink drink) {
    double alkoholmenge = 0;
    alkoholmenge = (drink.quantity * (drink.volume / 100) * 0.8);
    permille = permille + (alkoholmenge / (robert.gewicht * 0.68));
  }

  permillechecker() {
    String permillevalue = "";
    if (permille > 1) {
      permillevalue = "zu viel";
      return permillevalue;
    } else {
      permillevalue = permille.toStringAsFixed(2);
      return permillevalue;
    }
  }

  drivecarchecker() {
    String drivecar = "";
    double cartime = 0;
    if (permille > 0.5) {
      cartime = (permille - 0.5) / 0.1;
      drivecar = "Mit dem aktuellen Wert darfst Du ein Fahrzeug in " +
          cartime.toStringAsFixed(1) +
          " Stunden wieder lenken.";
      return drivecar;
    } else {
      drivecar =
          "Mit dem aktuellen Wert darfst Du ein Fahrzeug lenken. Sei vorsichtig";
      return drivecar;
    }
  }

  givemecolor() {
    if (permille > 0.5) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  givemedate() {
    final now = new DateTime.now();
    String formatted = DateFormat('kk:mm').format(now);
    return formatted;
  }
}
