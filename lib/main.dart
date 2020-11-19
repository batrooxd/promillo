import 'package:flutter/material.dart';
import 'package:promillo/tabs/tabbar.dart';
import 'package:provider/provider.dart';

import 'classes/drink.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrinkList()),
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyTabBar(),
    ),
  );
}

class Counter extends ChangeNotifier {
  int counter = 0;

  incrementCounter() {
    counter++;
    notifyListeners();
  }
}

class DrinkList extends ChangeNotifier {
  List<Drink> meineDrinkListe = [];

  adddrink(Drink drink) {
    meineDrinkListe.add(drink);
    notifyListeners();
  }
}
