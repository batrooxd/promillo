import 'package:flutter/material.dart';
import 'package:promillo/tabs/tabbar.dart';
import 'package:provider/provider.dart';

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
    meineDrinkListe.add(drink);
    addpermille(drink);
    notifyListeners();
  }

  addpermille(Drink drink) {
    double alkoholmenge = 0;
    alkoholmenge = (drink.quantity * (drink.volume / 100) * 0.8);
    permille = permille + (alkoholmenge / (robert.gewicht * 0.68));
  }

  givemedate() {
    final now = new DateTime.now();
    return now.toString();
  }
}
